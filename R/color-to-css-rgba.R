#' Color to CSS rgba() function call
#'
#' @description
#' Convert color names or hex values to CSS rgba() function calls.
#'
#' @param color A vector of color names and/or hex strings.
#' @param alpha A vector of alpha channel values from 0 to 1.
#'
#' @returns A character vector of the same length as `color`.
#' @export
#'
#' @examples
#' color_to_css_rgba(c("red", "#FF0000"), alpha = c(.2, .4))
#'
color_to_css_rgba <- function(color, alpha = 1) {
  mat <- grDevices::col2rgb(color)

  ls <- apply(mat, 2, \(col) {
    paste(as.numeric(col), collapse = ",")
  })

  rgba <- mapply(
    FUN = \(x, a) {
      x <- paste(x, a, sep = ",")

      paste0("rgba(", x, ")")
    },
    ls, alpha
  )

  unname(rgba)
}
