# Calculate percentages

Calculate a percentage using the formula \\n \* 100 / total\\. Rounding
is done by
[`round_ties_away()`](https://eliotmonaco.github.io/setmeup/reference/round_ties_away.md).

## Usage

``` r
pct(n, total, digits = 0, format = FALSE)
```

## Arguments

- n, total:

  Numeric vectors of equal length or with at least one vector of length
  1.

- digits:

  An integer indicating the number of decimal (when positive) or whole
  number (when zero or negative) places to round the output. (See the
  same argument in
  [`round_ties_away()`](https://eliotmonaco.github.io/setmeup/reference/round_ties_away.md).)

- format:

  Logical indicating if the output should be formatted with a "%" sign
  and if percentages that round to 0 should be replaced with "\< 1%".

## Value

A numeric vector the same length as the longer of `n` or `total.`

## Examples

``` r
x <- seq(1, 200, by = 20)

pct(sqrt(x), 100, digits = 2)
#>  [1]  1.00  4.58  6.40  7.81  9.00 10.05 11.00 11.87 12.69 13.45
```
