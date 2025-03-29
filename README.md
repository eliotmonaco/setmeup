
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

Set up a data analysis project fast with `setup_project_structure()` and
`use_rmd_template()`. First, create a new project. Then run this:

``` r
library(setmeup)
setup_project_structure()
use_rmd_template()
```

These functions

1.  Create a simple and logical internal project structure
2.  Set up an R Notebook template ready for an analysis
