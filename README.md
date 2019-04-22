
# DepthProc

<!-- README.md is generated from README.Rmd. Please edit that file -->

*DepthProc* project consist of a set of statistical procedures based on
so called statistical depth functions. The project involves free
available R package and its description.

### Versions

#### CRAN release version

[![GitHub
stars](https://img.shields.io/github/stars/zzawadz/DepthProc.svg?style=social&label=Stars)](https://github.com/zzawadz/DepthProc/stargazers)
[![GitHub
watchers](https://img.shields.io/github/watchers/zzawadz/DepthProc.svg?style=social&label=Watch)](https://github.com/zzawadz/DepthProc)

[![CRAN
version](https://www.r-pkg.org/badges/version/DepthProc)](https://cran.rstudio.com/web/packages/DepthProc/index.html)
[![Downloads](https://cranlogs.r-pkg.org/badges/DepthProc)](https://cran.rstudio.com/package=DepthProc)
[![](https://cranlogs.r-pkg.org/badges/grand-total/DepthProc)](https://cran.rstudio.com/web/packages/DepthProc/index.html)
[![Build
Status](https://travis-ci.org/zzawadz/DepthProc.svg?branch=master)](https://travis-ci.org/zzawadz/DepthProc)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/zzawadz/DepthProc?branch=master&svg=true)](https://ci.appveyor.com/project/zzawadz/DepthProc)
[![Coverage
Status](https://img.shields.io/codecov/c/github/zzawadz/DepthProc/master.svg)](https://codecov.io/github/zzawadz/DepthProc?branch=master)
[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

## Installation

*DepthProc* is avaiable on CRAN:

``` r
install.packages("DepthProc")
```

You can also install it from GitHub with *devtools* package:

``` r
library(devtools)
install_github("zzawadz/DepthProc")
```

## Main features:

### Speed and multithreading

Most of the code is written in C++ for additional efficiency. We also
use OpenMP to speedup computations with multithreading:

``` r
library(DepthProc)
set.seed(123)

d <- 10
x <- mvrnorm(1000, rep(0, d), diag(d))
# Default - utilize as many threads as possible
system.time(depth(x, x, method = "LP"))
#>    user  system elapsed 
#>   0.351   0.000   0.090

# Only single thread - 4 times slower:
system.time(depth(x, x, method = "LP", threads = 1))
#>    user  system elapsed 
#>   0.208   0.000   0.208

# Two threads - 2 times slower:
system.time(depth(x, x, method = "LP", threads = 2))
#>    user  system elapsed 
#>   0.201   0.000   0.103
```

## Available depth functions

``` r
x <- mvrnorm(100, c(0, 0), diag(2))

depthEuclid(x, x)
depthMah(x, x)
depthLP(x, x)
depthProjection(x, x)
depthLocal(x, x)
depthTukey(x, x)

## Base function to call others:
depth(x, x, method = "Projection")
depth(x, x, method = "Local", depth_params1 = list(method = "LP"))

## Get median
depthMedian(x, 
  depth_params = list(
    method = "Local",
    depth_params1 = list(method = "LP")))
```

## Basic plots

### Contour plot

``` r
library(mvtnorm)
y <- rmvt(n = 200, sigma = diag(2), df = 4, delta = c(3, 5))
depthContour(y, points = TRUE, graph_params = list(lwd = 2))
```

![](man/figures/README-contour-1.png)<!-- -->

### Perspective plot

``` r
depthPersp(y, depth_params = list(method = "Mahalanobis"))
```

![](man/figures/README-persp-1.png)<!-- -->

## Functional depths:

There are two functional depths implemented - modified band depth (MBD),
and Frainman-Muniz depth (FM):

``` r
x <- matrix(rnorm(60), nc = 20)
fncDepth(x, method = "MBD")
fncDepth(x, method = "FM", dep1d = "Mahalanobis")
#> Warning in dep1d_params$u <- u[, i]: Coercing LHS to a list
```

### Functional BoxPlot

``` r
x <- matrix(rnorm(2000), ncol = 100)
fncBoxPlot(x, bands = c(0, 0.5, 1), method = "FM")
```

![](man/figures/README-fncBox-1.png)<!-- -->
