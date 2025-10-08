#' Setup project structure
#'
#' @description
#' Create subdirectories for an R project.
#'
#' @details
#' ## Default subdirectories created under `root`
#'
#' For `type = "analysis"`:
#'
#' - `data/`
#'     + `1-source/`: Unmodified source data files originating outside of the
#'     project.
#'     + `2-final/`: Final data products (native R formats only).
#' - `output/`: Outputs for consumption outside R (e.g., CSV, XLSX, XML, HTML,
#' PDF).
#' - `scripts/`: All script files (e.g., R, RMD, QMD).
#'
#' For `type = "dashboard"`:
#'
#' - `data/`: All data files.
#' - `scripts/`: All script files (e.g., R, RMD, QMD).
#'
#' Directories are created recursively by [base::dir.create()].
#'
#' @param root The project root directory (defaults to the current working
#' directory).
#' @param type The type of project to create (`"analysis"` or `"dashboard"`).
#' @param dirs The subdirectories to create, as a character vector. The defaults
#' are described in the Details section.
#' @param rmd Call [use_rmd_template()] if TRUE (with defaults only, currently).
#'
#' @return `root` (invisibly).
#' @export
#'
#' @examples
#' \dontrun{
#' setup_project(type = "analysis")
#' }
#'
setup_project <- function(
    root = getwd(),
    type = c("analysis", "dashboard"),
    dirs = NULL,
    rmd = TRUE) {
  type <- match.arg(type)

  if (is.null(dirs) && type == "analysis") {
    dirs <- c(
      "data/1-source",
      "data/2-final",
      "output",
      "scripts"
    )
  } else if (is.null(dirs) && type == "dashboard") {
    dirs <- c(
      "data",
      "scripts"
    )
  }

  dirs <- paste(root, dirs, sep = "/")

  lapply(dirs, dir.create, recursive = TRUE)

  if (rmd) {
    use_rmd_template()
  }

  invisible(root)
}
