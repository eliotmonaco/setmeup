# Color to hexadecimal value

Convert color names to their hexadecimal values.

## Usage

``` r
color_to_hex(color, alpha = NULL)
```

## Arguments

- color:

  A vector of color names and/or hex strings.

- alpha:

  A vector of alpha channel values from 0 to 1.

## Value

A character vector of the same length as `color`.

## Details

When `alpha` is null, a hex value is returned without an alpha channel.
Hex values with or without the alpha channel are accepted as input.
However, the `alpha` argument determines if the alpha channel is
included in the output.

## Examples

``` r
color_to_hex(c("blue", "white"))
#> [1] "#0000FF" "#FFFFFF"

color_to_hex(c("lightgreen", "#90EE90"), alpha = c(.2, .4))
#> [1] "#90EE9033" "#90EE9066"
```
