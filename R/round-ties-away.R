#' Round to nearest value, ties away from 0
#'
#' @description
#' Round numbers to the nearest whole or decimal value with ties (numbers
#' halfway between two values, i.e., ending in 5) rounding to the nearest value
#' in the direction away from zero.
#'
#' @details
#' [base::round()] rounds numbers using the "ties to even" method, resulting in
#' both `round(1.5)` and `round(2.5)` evaluating to `2`. This method attempts to
#' counteract bias in data sets that include numbers that have already been
#' rounded using the "ties away from 0" method (see links below for more
#' detail). Alternatively, `round_ties_away()` rounds numbers using the "ties
#' away from 0" method, resulting in `round_ties_away(1.5)` evaluating to `2`
#' and `round_ties_away(2.5)` evaluating to `3`. This may be preferred in some
#' scenarios, e.g., when presenting results.
#'
#' Code in this function was copied from [janitor::round_half_up()] (version
#' 2.2.0), which was itself copied from a Stack Overflow forum (see the link
#' below).
#'
#' Resources:
#'
#' - [Wikipedia entry on Rounding][1]
#' - [Stack Overflow discussion and early source of the function code][2]
#'
#' [1]: https://en.wikipedia.org/wiki/Rounding
#' [2]: https://stackoverflow.com/questions/12688717/round-up-from-5
#'
#' @param x A numeric vector.
#' @param digits An integer indicating the number of decimal (when positive) or
#' whole number (when zero or negative) places to round `x` to. The rounding
#' place is equivalent to \eqn{1 / 10^{digits}}. `1` rounds to the nearest
#' tenths place, `0` rounds to the nearest ones place, and `-1` rounds to the
#' nearest tens place. (This behaves the same as the `digits` argument in
#' [base::round()].)
#'
#' @return A numeric vector the same length as `x`.
#' @export
#'
#' @examples
#' x1 <- seq(-2.5, 2.5, by = 0.5)
#' x2 <- seq(-0.025, 0.025, by = 0.005)
#' x3 <- seq(-250, 250, by = 50)
#'
#' x1
#' round(x1)
#' round_ties_away(x1)
#'
#' x2
#' round(x2, digits = 2)
#' round_ties_away(x2, digits = 2)
#'
#' x3
#' round(x3, digits = -2)
#' round_ties_away(x3, digits = -2)
#'
round_ties_away <- function(x, digits = 0) {
  if (
    !is.numeric(digits) ||
    length(digits) != 1 ||
    digits != round(digits) # check that `digits` is pos or neg integer
  ) {
    stop("`digits` must be a single integer")
  }

  # Code below taken from `round_half_up()` in janitor v2.2.0
  posneg <- sign(x)
  z <- abs(x) * 10^digits
  z <- z + 0.5 + sqrt(.Machine$double.eps)
  z <- trunc(z)
  z <- z / 10^digits
  z * posneg
}
