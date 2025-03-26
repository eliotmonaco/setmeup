#' Use an RMD template from this package
#'
#' @description
#' This is a wrapper for [rmarkdown::draft()]. It copies the contents of the
#' specified template folder into the `scripts/` directory (created by
#' [setup_project_structure()]).
#'
#'
#' @param filename The file name for the script.
#' @param template The name of the RMD template.
#'
#' @returns `filename` (invisibly).
#' @export
#'
#' @examples
#' \dontrun{
#' use_rmd_template(filename = "my-analysis.rmd", template = "nb1")
#' }
#'
use_rmd_template <- function(filename, template) {
  requireNamespace("rmarkdown", quietly = TRUE)

  rmarkdown::draft(
    file = paste0("scripts/", filename),
    template = template,
    package = "setmeup"
  )
}
