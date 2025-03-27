#' Fix column names
#'
#' @description
#' Change column names to snake case and remove or replace non-word characters.
#'
#' @param x A vector of column names.
#'
#' @returns A character vector the same length as `x`.
#' @export
#'
#' @examples
#' cols <- c(
#'   "Messy/Unpleasant Column Names",
#'   "checkThisCamelCase",
#'   "Letters674next0to827654digits4",
#'   "ordinal numbers: 1st 32nd 43rd 54th 900th",
#'   "this&THAT",
#'   "THIS/that",
#'   " Hello, World!!! ",
#'   "hyphenated-words",
#'   "words in 'quotes' or even \"quotes\""
#' )
#'
#' fix_colnames(cols)
#'
fix_colnames <- function(x) {
  chars1 <- paste(
    "\\.", ",", ":", ";", "\\?", "\\!", "\\*", "@", "#", "-",
    "\\[", "\\]", "\\{", "\\}", "\\(", "\\)",
    "\\|", "`", "=", "\\+", "\\^", "~", "<", ">", "\\$", "%",
    sep = "|"
  )

  chars2 <- paste("\\\"", "'", sep = "|")

  ordinals <- c(
    "(1[1-3])_(th_|th\\b)", # 11th, 12th, 13th
    "([2-9]?1)_(st_|st\\b)", # 1st, 21st...91st
    "([2-9]?2)_(nd_|nd\\b)", # 2nd, 22nd...92nd
    "([2-9]?3)_(rd_|rd\\b)", # 3rd, 23rd...93rd
    "([1-9]?[4-9])_(th_|th\\b)", # 4th-9th, 14th-19th...94th-99th
    "([1-9]0{0,10}0)_(th_|th\\b)" # 10th...900000000000th by 10s
  )

  x <- x |>
    trimws(which = "both") |>
    gsub(pattern = "\\s", replacement = "_") |>
    # Separate camel case
    gsub(pattern = "([[:lower:]])([[:upper:]])", replacement = "\\1_\\2") |>
    # Separate digit + letter
    gsub(pattern = "(\\d)([[:alpha:]])", replacement = "\\1_\\2") |>
    gsub(pattern = "([[:alpha:]])(\\d)", replacement = "\\1_\\2") |>
    # "&" --> "and"
    gsub(pattern = "&", replacement = "_and_") |>
    # "/" --> "or"
    gsub(pattern = "/", replacement = "_or_") |>
    gsub(pattern = chars1, replacement = "_") |>
    gsub(pattern = chars2, replacement = "") |>
    # Remove multiples of "_"
    gsub(pattern = "_{2,}", replacement = "_") |>
    # Remove "_" at start or end
    gsub(pattern = "^_|_$", replacement = "") |>
    tolower()

  # Remove "_" when introduced in an ordinal number
  for (i in 1:length(ordinals)) {
    x <- x |>
      gsub(pattern = ordinals[i], replacement = "\\1\\2", perl = TRUE)
  }

  x
}
