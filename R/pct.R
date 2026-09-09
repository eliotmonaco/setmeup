#' Calculate percentages
#'
#' @description
#' Calculate a percentage using the formula \eqn{n * 100 / total}. Rounding is
#' done by [round_ties_away()].
#'
#' @param n,total Numeric vectors of equal length or with at least one vector of
#' length 1.
#' @param digits An integer indicating the number of decimal (when positive) or
#' whole number (when zero or negative) places to round the output. (See the
#' same argument in [round_ties_away()].)
#' @param format Logical indicating if the output should be formatted with a "%"
#' sign and if percentages that round to 0 should be replaced with "< 1%".
#'
#' @return A numeric vector the same length as the longer of `n` or `total.`
#' @export
#'
#' @examples
#' x <- seq(1, 200, by = 20)
#'
#' pct(sqrt(x), 100, digits = 2)
#'
pct <- function(n, total, digits = NULL, format = FALSE) {
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

  pct <- n / total * 100

  if (!is.null(digits)) {
    pct <- round_ties_away(pct, digits = digits)
  }

  if (format) {
    df <- data.frame(n, pct)

    fmt <- unlist(apply(df, 1, function(x) {
      if (x[2] %in% c(-Inf, Inf)) {
        x[2]
      } else if (!is.na(x[2])) {
        if (x[2] != 0 || (x[1] == 0 && x[2] == 0)) {
          y <- x[2]
        } else if (x[1] > 0 && x[2] == 0) {
          y <- paste("<", 1 / 10^digits)
        } else if (x[1] < 0 && x[2] == 0) {
          y <- paste(">", -1 / 10^digits)
        }

        paste0(y, "%")
      } else {
        ""
      }
    }))

    fmt
  } else {
    pct
  }
}
