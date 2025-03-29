#' Use an RMD template from this package
#'
#' @description
#' This is a wrapper for [rmarkdown::draft()]. By default, it copies the
#' relevant files for the "nb1" RMD template into the `scripts/` folder (created
#' by [setup_project_structure()]).
#'
#' @details
#' The R Notebook template "nb1" has three related files.
#'
#' - `_output.yml` contains the YAML options under `html_notebook`. These will
#' be shared by any markdown documents in the same directory (see [Shared
#' Options, R Markdown: The Definitive Guide][sh]).
#' - `render.R` contains a call to [rmarkdown::render()] that's prepopulated to
#' execute the notebook and save the `.nb.html` report in the project's
#' `output/` directory (created by [setup_project_structure()]).
#' - `skeleton.Rmd` is the R Notebook file. When `use_rmd_template()` is
#' executed, the file will be saved with the name specified in the `filename`
#' argument.
#'
#' [sh]: https://bookdown.org/yihui/rmarkdown/html-document.html#shared-options
#'
#' @param filename The file name for the script.
#' @param template The name of the RMD template.
#' @param dir The destination directory.
#'
#' @returns `filename` (invisibly).
#' @export
#'
#' @examples
#' \dontrun{
#' use_rmd_template("my-analysis")
#' }
#'
use_rmd_template <- function(
    filename = "analysis",
    template = "nb1",
    dir = "scripts") {
  requireNamespace("rmarkdown", quietly = TRUE)

  dir <- sub("/$", "", dir)

  if (!dir.exists(dir)) {
    stop(paste0("Folder `", dir, "` not found"))
  }

  rmarkdown::draft(
    file = paste(dir, filename, sep = "/"),
    template = template,
    package = "setmeup",
    edit = FALSE
  )
}
