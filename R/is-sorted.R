#' Check if values are sorted
#'
#' @description
#' Check if values are sorted in increasing order from left to right.
#'
#' @details
#' Any number of vectors can be compared. If the input is a single vector, the
#' order of elements in that vector is checked. However, if the input is
#' multiple vectors, the order of elements across all vectors at each index is
#' checked. `NA`s are ignored.
#'
#' @param ... One vector, or multiple vectors of the same length.
#'
#' @return If there is one input, a logical value. If there are multiple inputs,
#' a logical vector the same length as the inputs.
#' @export
#'
#' @examples
#' is_sorted(letters)
#'
#' is_sorted(rev(letters))
#'
#' x <- 1:5
#' y <- c(2, 3, NA, 0, 5)
#' is_sorted(x, y)
#'
#' df <- data.frame(
#'   d1 = seq.Date(
#'     as.Date("1980-01-01"),
#'     as.Date("1980-12-31"),
#'     by = "month"
#'   ),
#'   d2 = seq.Date(
#'     as.Date("1990-01-01"),
#'     as.Date("1990-12-31"),
#'     by = "month"
#'   ),
#'   d3 = seq.Date(
#'     as.Date("1985-01-01"),
#'     as.Date("1996-01-01"),
#'     by = "year"
#'   )
#' )
#'
#' df$sorted <- is_sorted(df$d1, df$d2, df$d3)
#'
#' df
#'
is_sorted <- function(...) {
  args <- list(...)

  if (length(unique(lapply(args, length))) != 1) {
    stop("Vectors must be of equal length")
  }

  if (length(args) == 1) {
    df <- rbind(...)
  } else {
    df <- cbind(...)
  }

  apply(
    X = df,
    MARGIN = 1,
    FUN = function(x) {
      seq <- stats::na.omit(x)
      # Compare the order of `seq` to the sorted order
      all(seq == sort(seq))
    }
  ) |>
    unname()
}
