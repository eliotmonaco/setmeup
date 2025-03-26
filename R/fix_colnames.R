#' Fix column names
#'
#' @description
#' Change column names to snake case.
#'
#' @param x A vector of column names.
#'
#' @returns A character vector the same length as `x`.
#' @export
#'
#' @examples
#' s <- paste(
#'   "Some words and stuff plus punctuation",
#'   ". , : ; ? ! / * @ # - _ \" ' [ ] { } ( )",
#'   "And symbols",
#'   "| ` = + ^ ~ < > $",
#'   "And these",
#'   "% &",
#'   "checkThisCamelCase",
#'   "Letters674next0to827654digits4",
#'   "THIS/THAT"
#' )
#'
#' fix_colnames(s)
#'
fix_colnames <- function(x) {
  chars <- c(
    # Punctuation without "_" and "/"
    "\\.", ",", ":", ";", "\\?", "\\!",
    "\\*", "@", "#", "-", "\\\"", "'",
    "\\[", "\\]", "\\{", "\\}", "\\(", "\\)",
    # Symbols
    "\\|", "`", "=", "\\+", "\\^", "~", "<", ">", "\\$",
    # Other
    "%", "&"
  )
  chars <- paste(chars, collapse = "|")

  x |>
    gsub(pattern = "\\s", replacement = "_") |>
    gsub(pattern = "([[:lower:]])([[:upper:]])", replacement = "\\1_\\2") |>
    gsub(pattern = "(\\d)([[:alpha:]])", replacement = "\\1_\\2") |>
    gsub(pattern = "([[:alpha:]])(\\d)", replacement = "\\1_\\2") |>
    gsub(pattern = "/", replacement = "_or_") |>
    gsub(pattern = chars, replacement = "") |>
    gsub(pattern = "_{2,}", replacement = "_") |>
    tolower()
}
