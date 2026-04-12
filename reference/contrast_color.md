# Get a contrasting color

Based on the luminance value of `color`, get the color, either black or
white, that is most contrasting.

## Usage

``` r
contrast_color(color)
```

## Arguments

- color:

  A vector of color names and/or hex color values.

## Value

A character vector of the same length as `color`.

## Examples

``` r
contrast_color(c("black", "white", "#FF0000", "#888"))
#> [1] "#FFFFFF" "#000000" "#FFFFFF" "#FFFFFF"
```
