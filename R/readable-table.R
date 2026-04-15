#' Make a readable table
#'
#' @description
#' Transform a dataframe so that it can be written to a text file as an easily
#' readable table. Row names are not preserved.
#'
#' @param df A dataframe.
#' @param width The maximum width of each column.
#'
#' @returns A dataframe.
#' @export
#'
#' @examples
#' df <- data.frame(
#'   x = c(
#'     "One line of text   ",
#'     "This text should be on 2 lines"
#'   ),
#'   y = c(
#'     "This text should be on 4 lines etc etc etc etc etc etc",
#'     "   One line of text"
#'   )
#' )
#'
#' df2 <- readable_table(df, width = 16)
#'
#' \dontrun{
#' write.table(
#'   df2,
#'   file = "readable-table-example.txt",
#'   sep = "\t",
#'   quote = FALSE,
#'   row.names = FALSE
#' )
#' }
#'
readable_table <- function(df, width) {
  width <- width + 1

  # Add var names as first row
  df <- rbind(colnames(df), df)

  # Add line breaks to each cell
  df <- apply(df, 2, function(c) {
    c2 <- strwrap(trimws(c), width = width, simplify = FALSE)

    sapply(c2, function(x) {
      paste0(x, collapse = "\n")
    })
  })

  df <- as.data.frame(df)

  df <- apply(df, 1, function(r) {
    # Count the number of line breaks in each row
    loc <- gregexpr(pattern = "\n", text = r, fixed = TRUE)

    n <- sapply(loc, function(x) {
      ml <- attr(x, "match.length")

      ml <- ml[ml != -1]

      length(ml)
    })

    # Add "\n" to cells with fewer than the max number of "\n" per row
    x <- lapply(max(n) - n, function(x) {
      paste(rep("\n ", x), collapse = "")
    })

    paste0(r, x)
  })

  df <- as.data.frame(t(df))

  # Split each string in each column at "\n"
  df <- apply(df, 2, function(c) {
    vpad(trimws(unlist(strsplit(c, "\n", fixed = TRUE))))
  })

  df <- as.data.frame(df)

  # Return var names to header
  colnames(df) <- as.character(df[1,])

  df <- df[2:nrow(df),]

  rownames(df) <- NULL

  df
}

# Pad each vector element to match the width of the widest element
vpad <- function(x) {
  fmt <- paste0("%-", max(nchar(x)), "s")

  sprintf(fmt, x)
}
