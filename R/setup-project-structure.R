#' Setup project structure
#'
#' This function creates subdirectories for a data project.
#'
#' ```
#' project-root-dir
#' |--- data
#'      |--- 1-source
#'      |--- 2-aux
#'      |--- 3-final
#' |--- output
#' |--- scripts
#' ```
#'
#' @param dir The project root directory. Defaults to the current working directory.
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
