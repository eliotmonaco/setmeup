#' Find duplicated rows
#'
#' @description
#' Keep only the duplicated rows in a dataframe.
#'
#' @details
#' The output is sorted with duplicate rows adjacent to each other. A `dupe_id`
#' variable is added which numbers each duplicate set.
#'
#' @param df A dataframe.
#' @param vars Variables whose values determine which rows are identified as
#' duplicates.
#'
#' @returns A dataframe consisting of only duplicated rows.
#' @export
#'
#' @examples
#' df <- data.frame(
#'   row_id = paste0("r", 1:12),
#'   var1 = rep(LETTERS[1:4], 3),
#'   var2 = c(1:4, 1, 12:14, 1:2, 23:24)
#' )
#'
#' find_dupes(df, vars = c("var1", "var2"))
#'
find_dupes <- function(df, vars) {
  if (!is.data.frame(df)) {
    stop("`df` must be a dataframe")
  }

  cols <- colnames(df)

  # Get duplicated rows
  df2 <- df[duplicated(df[, vars]), vars, drop = FALSE]

  df2 <- unique(df2)

  # Create dupe ID variable name
  if ("dupe_id" %in% colnames(df)) {
    id_var <- paste("dupe_id", Sys.time()) |>
      gsub(pattern = "\\s", replacement = "_")
  } else {
    id_var <- "dupe_id"
  }

  # Add sequential ID numbers to distinct rows
  df2[[id_var]] <- 1:nrow(df2)

  # Merge dataframes and keep rows with shared values across `vars`
  df <- merge(x = df, y = df2, by = vars)

  df <- df[, c(cols, id_var)]

  # Sort rows by `id_var`
  df <- df[order(df[[id_var]]), ]

  # Reset row names reordered by `merge()`
  rownames(df) <- 1:nrow(df)

  df
}
