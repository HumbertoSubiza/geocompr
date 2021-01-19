library(sf)
library(dplyr)
#

## primeiro arquivo
path <- 'C:/Users/Walter Pina/Documents/bases/Cadastro de localidades/br_capitais.shp'
capitais <- read_sf(path) # le capitais com sf

# cria identificacao com numeracao sequencial
capitais$id <- seq(1,27,1)
colnames(capitais) <- c("name","sigla_uf","geometry","id")

## segundo arquivo
path2 <- 'C:/Users/Walter Pina/Documents/bases/br_uf.shp'
brasil <- read_sf(path2) # le capitais com sf

brasil$gid <- seq(28,54,1)


# simplificando o contorno do Brasil
cat("Tamanho inicial= ", object.size(brasil), "bytes")

brasil_simples <- st_simplify(brasil, 
                              dTolerance       = 0.1,
                              preserveTopology = T)

cat("Tamanho final= ", object.size(brasil_simples), "bytes")
plot(brasil_simples["gid"])

## criacao geometria
# geometria
br_geom <- st_geometry(brasil_simples, value = NULL)
br_geom 

# geometrias, extrai e define crs
cap_geom <- st_geometry(capitais, value = NULL)
cap_geom

# cria  geometry collection a partir de objetos sfg, o mesmo CRS
br_geom_coll <- c(st_geometrycollection(cap_geom), st_geometrycollection(br_geom ))

.......

plot(br_geom, reset = F, lwd =3, axes =T)
plot(cap_geom, add = T, col = "red", lwd =3)


### atributos

## com atributos
# armazena atributos
cap_att <- capitais

st_geometry(cap_att) <- NULL # remove geometry, coerce to data.frame


# atributos
br_att <- brasil

st_geometry(br_att) <- NULL # remove geometry, coerce to data.frame

library(dplyr)



brasil_att <- full_join(cap_att, br_att, by = c("id" = "gid"))


br_geom <- st_sfc(br_geom_coll, crs = 4674)


brasil_sf <- st_sf(brasil_att, geometry = br_geom)

# conexao com banco de dados e gravacao do arquivo sf, geom collection com apenas geometria
# 
library(DBI)
con <- dbConnect(RPostgres::Postgres(), user = 'postgres',
                 password = 'postgres', dbname = 'r_databases', port = 5433)

# grava geom collection sf para database
dbWriteTable(con, "brasil_sf", brasil_sf, overwrite = T )
dbDisconnect(con)



### Leitura a partir da base de dados Postgres com biblioteca _RPostgres_. 

#No fragmento que segue podemos incluir comandos SQL para capturar toda ou parte da tabela desejada.

---

try(conn <- dbConnect(Postgres(), 
                      user     = 'postgres',
                      password = 'postgres', 
                      dbname   = 'r_databases', 
                      port     = 5433))

if (exists("conn") && !inherits(conn, "try-error")) {
        brasil_geom_coll_db = st_read(conn, 
                             query = "select * from brasil_sf;")
        print(st_crs(brasil_geom_coll_db)) # CRS da base de dados!
        dbDisconnect(conn)
}



br_uf  <- st_collection_extract(
        brasil_geom_coll_db,
        type = c("POLYGON"),
        warn = FALSE)

br_cap  <- st_collection_extract(
        brasil_geom_coll_db,
        type = c("POINT"),
        warn = FALSE)


plot(br_uf["id"], axes = T, lwd =3)

plot(br_cap["id"], axes = T, lwd =3)

