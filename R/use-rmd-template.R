#' Use an RMD template from this package
#'
#' @description
#' This is a wrapper for [rmarkdown::draft()]. By default, it copies the
#' relevant files for the "nb1" RMD template into the `scripts/` folder (created
#' by [setup_project_structure()]).
#'
#'
#' @param filename The file name for the script.
#' @param template The name of the RMD template (defaults to `"nb1"`).
#' @param dir The destination directory (defaults to `"scripts"`).
#'
#' @returns `filename` (invisibly).
#' @export
#'
#' @examples
#' \dontrun{
#' use_rmd_template("my-analysis")
#' }
#'
use_rmd_template <- function(filename, template = "nb1", dir = "scripts") {
  requireNamespace("rmarkdown", quietly = TRUE)

  dir <- sub("/$", "", dir)

  rmarkdown::draft(
    file = paste(dir, filename, sep = "/"),
    template = template,
    package = "setmeup",
    edit = FALSE
  )
}
