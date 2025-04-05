#' Setup project structure
#'
#' @description
#' Create subdirectories for an R project.
#'
#' @details
#' By default, these subdirectories are created under `root`:
#'
#' - `data/1-source/`: Unmodified source data originating outside of the project.
#' - `data/2-aux/`: Intermediate data created within the project and/or anything not considered to be source or final data.
#' - `data/3-final/`: Final data products in native R formats only.
#' - `output/`: Final data products for consumption outside R (CSV, XLSX, XML, HTML, PDF, etc.).
#' - `scripts/`: All script files.
#'
#' Directories are created recursively by [base::dir.create()].
#'
#' @param root The project root directory (defaults to the current working
#' directory).
#' @param dirs The subdirectories to create, as a character vector. The defaults
#' are described in the Details section.
#'
#' @return `root` (invisibly).
#' @export
#'
#' @examples
#' \dontrun{
#' setup_project_structure()
#' }
#'
setup_project_structure <- function(
    root = getwd(),
    dirs = c(
      "data/1-source",
      "data/2-aux",
      "data/3-final",
      "output",
      "scripts"
    )) {
  dirs <- paste(root, dirs, sep = "/")

  lapply(dirs, dir.create, recursive = TRUE)

  invisible(root)
}
