#' Setup project structure
#'
#' @description
#' This function creates subdirectories for a data project.
#'
#' @details
#' The following subdirectories are created under `my-proj/`:
#'
#' ```
#' my-proj/
#' |--- data/
#'      |--- 1-source/
#'      |--- 2-aux/
#'      |--- 3-final/
#' |--- output/
#' |--- scripts/
#' ```
#'
#' | Folder | Use |
#' |---|---|
#' | `data/1-source/` | Unmodified source data originating outside the project. |
#' | `data/2-aux/` | Intermediate data created within the project or auxiliary data from outside the project. In other words, anything that isn't source or final data. |
#' | `data/3-final/` | End-point data products (native R format only). |
#' | `output/` | All data products intended for use outside R. |
#' | `scripts/` | All script files. |
#'
#' @param dir The project root directory. Defaults to the current working
#' directory.
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
