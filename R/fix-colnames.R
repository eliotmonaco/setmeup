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

  ordinals <- paste(
    "(?<=1[1-3])_(?=th(\\b|_))", # 11th, 12th, 13th
    "(?<=[2-9]?1)_(?=st(\\b|_))", # 1st, 21st...91st
    "(?<=[2-9]?2)_(?=nd(\\b|_))", # 2nd, 22nd...92nd
    "(?<=[2-9]?3)_(?=rd(\\b|_))", # 3rd, 23rd...93rd
    "(?<=[1-9]?[4-9])_(?=th(\\b|_))", # 4th-9th, 14th-19th...94th-99th
    "(?<=[1-9]0{0,10}0)_(?=th(\\b|_))", # 10th...90th, 1-90...0th
    sep = "|"
  )

  x |>
    gsub(pattern = "\\s", replacement = "_") |>
    gsub(pattern = "([[:lower:]])([[:upper:]])", replacement = "\\1_\\2") |>
    gsub(pattern = "(\\d)([[:alpha:]])", replacement = "\\1_\\2") |>
    gsub(pattern = "([[:alpha:]])(\\d)", replacement = "\\1_\\2") |>
    gsub(pattern = "/", replacement = "_or_") |>
    gsub(pattern = chars, replacement = "") |>
    gsub(pattern = "_{2,}", replacement = "_") |>
    # Remove "_" when introduced in an ordinal number
    gsub(pattern = ordinals, replacement = "", perl = TRUE) |>
    tolower()
}
