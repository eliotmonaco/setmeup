#' Convert a document to another format using Pandoc
#'
#' @description
#' Convert a document from one format to another by calling the `pandoc` system
#' command.
#'
#' @details
#' Pandoc must be installed. See https://pandoc.org/.
#'
#' @param file1,file2 The names of the file to convert and the destination file.
#' Include both filename extensions (this is how the "from" and "to" file
#' formats are determined).
#'
#' @returns A character vector if `file2` is a markdown or typst file, otherwise `NULL`.
#' @export
#'
#' @examples
#' \dontrun{
#' # Convert from Word to markdown
#' convert_doc("my-doc.docx", "my-doc.md")
#' }
#'
convert_doc <- function(file1, file2) {
  if (identical(file1, file2)) {
    stop("`file1` and `file2` cannot have the same name")
  }

  # Extract filename extensions and return Pandoc format name
  fmt <- lapply(list(file1, file2), \(x) {
    x <- unlist(strsplit(x, "\\."))

    x <- x[length(x)]

    ext <- switch(
      tolower(x),
      "docx" = "docx",
      "md" = "markdown",
      "txt" = "txt",
      "typ" = "typst"
    )

    if (!is.null(ext)) {
      ext
    } else {
      stop(paste0("\"", x, "\" isn't a recognized filename extension"))
    }
  })

  # Run the pandoc command
  system2(
    command = "pandoc",
    args = c(
      file1,           # source file
      "-f", fmt[[1]],  # "from" format
      "-t", fmt[[2]],  # "to" format
      "-o", file2,     # output file
      "-s",            # standalone document
      "--wrap", "none" # no word wrap
    ),
    stdout = TRUE,
    stderr = TRUE
  )

  if (fmt[[2]] %in% c("markdown", "typst")) {
    readLines(file2)
  } else {
    NULL
  }
}
