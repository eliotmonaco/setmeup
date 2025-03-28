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
#' df$ordered <- check_date_order(df$d1, df$d2, df$d3)
#'
#' df
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
