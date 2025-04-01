#' Title
#'
#' @param df
#' @param vars
#'
#' @returns
#' @export
#'
#' @examples
#'
keep_dupes <- function(df, vars) {
  if (!is.data.frame(df)) {
    stop("`df` must be a dataframe")
  }

  cols <- colnames(df)

  # Deduplicate rows by `vars`
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
