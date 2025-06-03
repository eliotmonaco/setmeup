
<!-- README.md is generated from README.Rmd. Please edit that file -->

# setmeup

<!-- badges: start -->

[![R-CMD-check](https://github.com/eliotmonaco/setmeup/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/eliotmonaco/setmeup/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/eliotmonaco/setmeup/graph/badge.svg)](https://app.codecov.io/gh/eliotmonaco/setmeup)
<!-- badges: end -->

setmeup has tools to expedite reproducible data analysis projects.

## Installation

Install from GitHub:

``` r
remotes::install_github("eliotmonaco/setmeup")
```

## Example

Set up a data analysis project fast with `setup_project()`. This runs
`use_rmd_template()` by default and so will 1) create a simple and
logical internal project structure, and 2) set up an R Notebook template
ready for an analysis.

``` r
setmeup::setup_project()
```
