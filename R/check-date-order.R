#' Check date order
#'
#' @description
#' Check if dates are ordered from earliest to latest.
#'
#' @details
#' Any number of date vectors can be checked. Elements at the same index are
#' compared. `NA`s are ignored.
#'
#' @param ... Date vectors entered in their expected order, earliest to latest.
#'
#' @return A logical vector the same length as the inputs.
#' @export
#'
#' @examples
#' dates <- seq.Date(
#'   as.Date("2023-01-01", "%Y-%m-%d"),
#'   as.Date("2023-12-31", "%Y-%m-%d"),
#'   by = "day"
#' )
#' dates <- c(dates, rep(NA, times = 10))
#'
#' n_rows <- 500
#'
#' df <- data.frame(
#'   d1 = sample(dates, n_rows, replace = TRUE),
#'   d2 = sample(dates, n_rows, replace = TRUE),
#'   d3 = sample(dates, n_rows, replace = TRUE),
#'   d4 = sample(dates, n_rows, replace = TRUE)
#' )
#'
#' df$ordered <- check_date_order(df$d1, df$d2, df$d3, df$d4)
#'
check_date_order <- function(...) {
  df <- cbind(...)

  apply(
    X = df,
    MARGIN = 1,
    FUN = function(dates) {
      # Convert a vector of dates to the underlying numeric values, removing NAs
      seq <- stats::na.omit(as.numeric(as.Date(dates)))
      # Compare the current order of `seq` to the sorted order (small to large)
      all(seq == sort(seq))
    }
  )
}
