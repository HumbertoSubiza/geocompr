with p as (
    select ST_Union(br_geom) as geom from br_geo
)
select 1 as id, 
ST_CollectionExtract(st_polygonize(p.geom), 3) as geom from p;

