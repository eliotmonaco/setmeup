#' Color to hexadecimal value
#'
#' @description
#' Convert color names to their hexadecimal values.
#'
#' @details
#' When `alpha` is null, a hex value is returned without an alpha channel. Hex
#' values with or without the alpha channel are accepted as input. However, the
#' `alpha` argument determines if the alpha channel is included in the output.
#'
#' @param color A vector of color names and/or hex strings.
#' @param alpha A vector of alpha channel values from 0 to 1.
#'
#' @returns A character vector of the same length as `color`.
#' @export
#'
#' @examples
#' color_to_hex(c("blue", "white"))
#'
#' color_to_hex(c("lightgreen", "#90EE90"), alpha = c(.2, .4))
#'
color_to_hex <- function(color, alpha = NULL) {
  mat <- grDevices::col2rgb(color, alpha = TRUE)

  args <- apply(mat, 2, as.list)

  if (is.null(alpha)) {
    args <- lapply(args, \(ls) ls[1:3])
  } else {
    args <- mapply(
      FUN = \(ls, a) {
        ls$alpha <- a * 255

        ls
      },
      args, alpha,
      SIMPLIFY = FALSE
    )
  }

  sapply(args, \(ls) {
    ls <- append(ls, list(maxColorValue = 255))

    do.call(grDevices::rgb, ls)
  })
}
