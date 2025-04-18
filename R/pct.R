#' Calculate percentage
#'
#' @description
#' Calculate a percentage using the formula \eqn{n * 100 / total}. Rounding is
#' done by [round_ties_away()].
#'
#' @param n,total Numeric vectors of equal length or with one of length 1.
#' @param digits An integer indicating the number of decimal (when positive) or
#' whole number (when zero or negative) places to round the output. (See the
#' same argument in [round_ties_away()].)
#'
#' @return A numeric vector the same length as the longer of `n` or `total.`
#' @export
#'
#' @examples
#' x <- seq(1, 200, by = 20)
#'
#' pct(sqrt(x), 100, digits = 2)
#'
pct <- function(n, total, digits = 1) {
  if (
    length(n) != length(total) &&
      length(n) != 1 &&
      length(total) != 1
  ) {
    stop(paste(
      "The lengths of `n` & `total` must be equal",
      "or one must be of length 1"
    ))
  }

  n <- as.numeric(n)
  total <- as.numeric(total)

  setmeup::round_ties_away(n / total * 100, digits = digits)
}
