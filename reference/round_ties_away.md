# Round to nearest value, ties away from 0

Round numbers to the nearest whole or decimal value with ties (numbers
halfway between two values, i.e., ending in 5) rounding to the nearest
value in the direction away from zero.

## Usage

``` r
round_ties_away(x, digits = 0)
```

## Arguments

- x:

  A numeric vector.

- digits:

  An integer indicating the number of decimal (when positive) or whole
  number (when zero or negative) places to round `x` to. The rounding
  place is equivalent to \\1 / 10^{digits}\\. `1` rounds to the nearest
  tenths place, `0` rounds to the nearest ones place, and `-1` rounds to
  the nearest tens place. (This behaves the same as the `digits`
  argument in [`base::round()`](https://rdrr.io/r/base/Round.html).)

## Value

A numeric vector the same length as `x`.

## Details

[`base::round()`](https://rdrr.io/r/base/Round.html) rounds numbers
using the "ties to even" method, resulting in both `round(1.5)` and
`round(2.5)` evaluating to `2`. This method attempts to counteract bias
in data sets that include numbers that have already been rounded using
the "ties away from 0" method (see links below for more detail).
Alternatively, `round_ties_away()` rounds numbers using the "ties away
from 0" method, resulting in `round_ties_away(1.5)` evaluating to `2`
and `round_ties_away(2.5)` evaluating to `3`. This may be preferred in
some scenarios, e.g., when presenting results.

Code in this function was copied from `janitor::round_half_up()`
(version 2.2.0), which was itself copied from a Stack Overflow forum
(see the link below).

Resources:

- [Wikipedia entry on Rounding](https://en.wikipedia.org/wiki/Rounding)

- [Stack Overflow discussion and early source of the function
  code](https://stackoverflow.com/questions/12688717/round-up-from-5)

## Examples

``` r
x1 <- seq(-2.5, 2.5, by = 0.5)
x2 <- seq(-0.025, 0.025, by = 0.005)
x3 <- seq(-250, 250, by = 50)

x1
#>  [1] -2.5 -2.0 -1.5 -1.0 -0.5  0.0  0.5  1.0  1.5  2.0  2.5
round(x1)
#>  [1] -2 -2 -2 -1  0  0  0  1  2  2  2
round_ties_away(x1)
#>  [1] -3 -2 -2 -1 -1  0  1  1  2  2  3

x2
#>  [1] -0.025 -0.020 -0.015 -0.010 -0.005  0.000  0.005  0.010  0.015  0.020
#> [11]  0.025
round(x2, digits = 2)
#>  [1] -0.03 -0.02 -0.02 -0.01 -0.01  0.00  0.00  0.01  0.01  0.02  0.03
round_ties_away(x2, digits = 2)
#>  [1] -0.03 -0.02 -0.02 -0.01 -0.01  0.00  0.01  0.01  0.02  0.02  0.03

x3
#>  [1] -250 -200 -150 -100  -50    0   50  100  150  200  250
round(x3, digits = -2)
#>  [1] -200 -200 -200 -100    0    0    0  100  200  200  200
round_ties_away(x3, digits = -2)
#>  [1] -300 -200 -200 -100 -100    0  100  100  200  200  300
```
