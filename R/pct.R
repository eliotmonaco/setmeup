#' Calculate percentage
#'
#' @description
#' Calculate a percentage using the formula \eqn{n * 100 / total}. Rounding is
#' done by [round_ties_away()].
#'
#' @param n,total Numeric vectors, or objects that can be coerced to numeric
#' vectors. If the lengths are unequal, the shorter vector must have length of 1
#' for it to be recycled.
#' @param digits An integer indicating the number of decimal (when positive) or
#' whole number (when zero or negative) places to round the output. (See the
#' same argument in [round_ties_away()].)
#'
#' @return A numeric vector the same length as the longer of `n` or `total.`
#' @export
#'
#' @examples
#' x <- sample(200:300, size = 10, replace = TRUE)
#'
#' pct(x, 300, digits = 2)
#'
pct <- function(n, total, digits = 1) {
  # Lengths of `n` & `total` must be equal, or the length of one must be 1
  if (
    length(n) != length(total) &&
      length(n) != 1 &&
      length(total) != 1
  ) {
    stop(
      "When the lengths of `n` & `total` are unequal, ",
      "the shorter vector must have length of 1 to be recycled"
    )
  }
  n <- as.numeric(n)
  total <- as.numeric(total)

  setmeup::round_ties_away(n / total * 100, digits = digits)
}
