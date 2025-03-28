#' Assign ID values to distinct dataframe rows
#'
#' @description
#' Assign sequential ID values to distinct dataframe rows based on the variables
#' specified in `vars`.
#'
#' @details
#' Row names are not preserved.
#'
#' @param df A dataframe.
#' @param vars Variables for determining row uniqueness.
#' @param id_name The name for the ID variable.
#' @param prefix An optional prefix added to all ID values.
#' @param seq_start The start number of the ID sequence.
#' @param digits The number of digits in the ID, including leading zeros. This
#' is used when larger than the minimum required.
#' @param promote Logical. If `TRUE`, the ID variable is the first column in the
#' output.
#'
#' @return A dataframe.
#' @export
#'
#' @examples
#' df <- data.frame(
#'   var1 = rep(LETTERS[1:3], 4),
#'   var2 = 1:2
#' )
#'
#' assign_id(
#'   df,
#'   id_name = "id",
#'   prefix = "id",
#'   vars = colnames(df)
#' )
#'
assign_id <- function(
    df,
    vars,
    id_name,
    prefix = NULL,
    seq_start = 1,
    digits = NULL,
    promote = TRUE) {
  if (!is.data.frame(df)) {
    stop("`df` must be a dataframe")
  }

  if (id_name %in% colnames(df)) {
    stop(paste0(
      "`", id_name, "` is already a variable in `df`. ",
      "Choose a different `id_name`."
    ))
  }

  if (!as.numeric(seq_start) > 0) {
    stop("`seq_start` must be a positive integer")
  }

  cols_src <- colnames(df)

  # Deduplicate rows by `vars`
  df_distinct <- df[!duplicated(df[, vars]), vars, drop = FALSE]

  # Find the highest ID number and its character count
  id_max <- nrow(df_distinct) + seq_start - 1
  char_min <- nchar(id_max)

  #  Add sequential ID numbers to distinct rows
  df_distinct[[id_name]] <- formatC(
    x = seq_start:id_max,
    width = max(digits, char_min),
    flag = "0"
  )

  # Add `prefix` to ID numbers
  if (!is.null(prefix)) {
    df_distinct[[id_name]] <- paste0(prefix, df_distinct[[id_name]])
  }

  # Create column to preserve original row order of `df`
  row_order <- paste0("row_order_", gsub("\\s", "_", Sys.time()))
  df[[row_order]] <- 1:nrow(df)

  # Join IDs from `df_distinct` to `df`
  df <- merge(x = df, y = df_distinct, by = vars)

  # Restore row and column order
  df <- df[order(df[[row_order]]), , drop = FALSE]
  df <- df[, c(cols_src, id_name)]

  if (promote) {
    df <- df[, c(id_name, cols_src)]
  }

  # Reset row names reordered by `merge()`
  rownames(df) <- 1:nrow(df)

  df
}
