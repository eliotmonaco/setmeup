#' Get a contrasting color
#'
#' @description
#' Based on the luminance value of `color`, get the color, either black or
#' white, that is most contrasting.
#'
#' @param color A vector of color names and/or hex color values.
#'
#' @returns A character vector of the same length as `color`.
#' @export
#'
#' @examples
#' contrast_color(c("black", "white", "#FF0000", "#888"))
#'
contrast_color <- function(color) {
  pkg <- requireNamespace("farver", quietly = TRUE)

  if (!pkg) {
    stop("The farver package must be installed to use this function.")
  }

  hcl <- farver::decode_colour(
    colour = color,
    to = "hcl"
  )

  as.character(ifelse(hcl[, "l"] > 60, "#000000", "#FFFFFF"))
}
