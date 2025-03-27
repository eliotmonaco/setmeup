#' Use an RMD template from this package
#'
#' @description
#' This is a wrapper for [rmarkdown::draft()]. It copies the relevant files for
#' the specified RMD template into the `scripts/` folder (created by
#' [setup_project_structure()]).
#'
#'
#' @param filename The file name for the script.
#' @param template The name of the RMD template (defaults to `"nb1"`).
#'
#' @returns `filename` (invisibly).
#' @export
#'
#' @examples
#' \dontrun{
#' use_rmd_template(filename = "my-analysis")
#' }
#'
use_rmd_template <- function(filename, template = "nb1") {
  requireNamespace("rmarkdown", quietly = TRUE)

  rmarkdown::draft(
    file = paste0("scripts/", filename),
    template = template,
    package = "setmeup",
    edit = FALSE
  )
}
