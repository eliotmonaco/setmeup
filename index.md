# setmeup

setmeup has tools to expedite reproducible data analysis projects.

## Installation

Install from GitHub:

``` r
remotes::install_github("eliotmonaco/setmeup")
```

## Example

Set up a data analysis project fast with
[`setup_project()`](https://eliotmonaco.github.io/setmeup/reference/setup_project.md).
This runs
[`use_rmd_template()`](https://eliotmonaco.github.io/setmeup/reference/use_rmd_template.md)
by default and so will 1) create a simple and logical internal project
structure, and 2) set up an R Notebook template ready for an analysis.

``` r
setmeup::setup_project()
```
