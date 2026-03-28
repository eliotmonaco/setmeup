# Color to CSS rgba() function call

Convert color names or hex values to CSS rgba() function calls.

## Usage

``` r
color_to_css_rgba(color, alpha = 1)
```

## Arguments

- color:

  A vector of color names and/or hex strings.

- alpha:

  A vector of alpha channel values from 0 to 1.

## Value

A character vector of the same length as `color`.

## Examples

``` r
color_to_css_rgba(c("red", "#FF0000"), alpha = c(.2, .4))
#> [1] "rgba(255,0,0,0.2)" "rgba(255,0,0,0.4)"
```
