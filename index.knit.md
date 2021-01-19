--- 
title: 'Geocomputation with R'
author: 'Robin Lovelace, Jakub Nowosad, Jannes Muenchow'
date: '2020-12-22'
knit: bookdown::render_book
site: bookdown::bookdown_site
documentclass: book
bibliography:
  - refs.bib
  - packages.bib
biblio-style: apalike
link-citations: yes
description: "Forthcoming book on geographic data with R."
github-repo: "Robinlovelace/geocompr"
url: 'https\://geocompr.robinlovelace.net'
---



# Welcome {-}

Welcome to the online home of *Geocomputation with R*, a forthcoming book with [CRC Press](https://www.crcpress.com/Chapman--HallCRC-The-R-Series/book-series/CRCTHERSER).

## Development {-}

Inspired by [**bookdown**](https://github.com/rstudio/bookdown) and other open source projects we are developing this book in the open.
This approach encourages contributions, ensures reproducibility and provides access to the material as it evolves.

The book's development can be divided into four main phases:

1. Basic methods
2. Applied geocomputation
3. Advanced methods
4. Geocomputation in the wild

Currently we are working on Part 3.
New chapters will be added to this website as the project progresses, hosted at [geocompr.robinlovelace.net](https://geocompr.robinlovelace.net) and kept up-to-date thanks to [Travis](https://travis-ci.org/Robinlovelace/geocompr), which rebuilds the book each time its source code changes, and provides a visual indicator that reports the build status:

[![Build Status](https://travis-ci.org/Robinlovelace/geocompr.svg?branch=master)](https://travis-ci.org/Robinlovelace/geocompr)

The version of the book you are reading now was built on 2020-12-22 and was built locally.

## How to contribute? {-}

**bookdown** makes editing a book as easy as editing a wiki, provided you have a GitHub account ([sign-up at github.com](https://github.com/)).
Once logged-in to GitHub, clicking on the 'edit me' icon highlighted in the image below will take you to the source [R Markdown](http://rmarkdown.rstudio.com/) where you can make changes:

[![](figures/editme.png)](https://github.com/Robinlovelace/geocompr/edit/master/index.Rmd)

To raise an issue about the book's content (e.g. code not running) or make a feature request, check-out the [issue tracker](https://github.com/Robinlovelace/geocompr/issues).

## Reproducibility {-}

To reproduce the book, you need a recent version of [R](https://cran.r-project.org/) and up-to-date packages, which can be installed with the following command (which requires [**devtools**](https://github.com/hadley/devtools)):





