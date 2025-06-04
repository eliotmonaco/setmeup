#' Setup project structure
#'
#' @description
#' Create subdirectories for an R project.
#'
#' @details
#' By default, these subdirectories are created under `root`:
#'
#' - `data/`
#'     + `1-source/`: Unmodified source data originating outside of the project.
#'     + `2-final/`: Final data products in native R formats only.
#' - `output/`: Outputs for consumption outside R (CSV, XLSX, XML, HTML, PDF, etc.).
#' - `scripts/`: All script files.
#'
#' Directories are created recursively by [base::dir.create()].
#'
#' @param root The project root directory (defaults to the current working
#' directory).
#' @param dirs The subdirectories to create, as a character vector. The defaults
#' are described in the Details section.
#' @param rmd Call [use_rmd_template()] if TRUE (with defaults only, currently).
#'
#' @return `root` (invisibly).
#' @export
#'
#' @examples
#' \dontrun{
#' setup_project()
#' }
#'
setup_project <- function(
    root = getwd(),
    dirs = c(
      "data/1-source",
      "data/2-final",
      "output",
      "scripts"
    ),
    rmd = TRUE) {
  dirs <- paste(root, dirs, sep = "/")

  lapply(dirs, dir.create, recursive = TRUE)

  use_rmd_template()

  invisible(root)
}
