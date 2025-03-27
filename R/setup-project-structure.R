#' Setup project structure
#'
#' @description
#' Create subdirectories for a data analysis project.
#'
#' @details
#' This function creates the following subdirectories under the hypothetical
#' project root directory `my-proj/`:
#'
#' ```{verbatim}
#' my-proj/
#' |--- data/
#'      |--- 1-source/
#'      |--- 2-aux/
#'      |--- 3-final/
#' |--- output/
#' |--- scripts/
#' ```
#'
#' | Folder           | Intended content                                           |
#' |------------------|------------------------------------------------------------|
#' | `data/1-source/` | Unmodified source data originating outside of the project. |
#' | `data/2-aux/`    | Intermediate data created within the project and/or<br>anything not considered to be source or final data. |
#' | `data/3-final/`  | Final data products in native R formats only.              |
#' | `output/`        | Final data products for consumption outside R.             |
#' | `scripts/`       | All script files.                                          |
#'
#' @param dir The project root directory (defaults to the current working
#' directory).
#'
#' @return `dir` (invisibly).
#' @export
#'
#' @examples
#' \dontrun{
#' setup_project_structure()
#' }
#'
setup_project_structure <- function(dir = getwd()) {
  dirs <- c(
    "data/1-source",
    "data/2-aux",
    "data/3-final",
    "output",
    "scripts"
  )

  dirs <- paste(dir, dirs, sep = "/")

  lapply(dirs, dir.create, recursive = TRUE)

  invisible(dir)
}
