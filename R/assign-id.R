#' Assign ID values to distinct dataframe rows
#'
#' @description
#' Assign sequential ID values to distinct dataframe rows based on the variables
#' specified in `vars`.
#'
#' @param df A dataframe.
#' @param id_name A name for the new ID variable.
#' @param prefix An optional prefix of characters to add to all ID values.
#' @param vars The variable names whose unique values the new ID will be based
#' on. Defaults to `colnames(df)`.
#' @param seq_start An integer for the beginning of the ID sequence. Defaults to
#' `1`.
#' @param digits An integer for the number of digits in the ID (including
#' leading zeros). Defaults to `nchar(nrow(df) + seq_start)`.
#' @param promote A logical value. If `TRUE`, move the ID column to the first
#' position in `df`.
#'
#' @return A dataframe.
#' @export
#'
#' @examples
#' df <- data.frame(
#'   row_id = paste("r", 1:24),
#'   a = rep(c("a", "b", "c"), times = 8),
#'   b = c(1, 1, 2, 2),
#'   c = c(TRUE, FALSE)
#' )
#'
#' df
#'
#' assign_id(
#'   df,
#'   id_name = "id",
#'   prefix = "id",
#'   vars = c("a", "b", "c")
#' )
#'
assign_id <- function(
    df,
    id_name,
    prefix = NULL,
    vars = colnames(df),
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

  # `df` row/col info
  cn_src <- colnames(df)
  rn_src <- rownames(df)

  # Find the minimum number of digits for the ID value
  digits_min <- nchar(nrow(df) + seq_start)

  # If `digits` is given a value less than `digits_min`, use `digits_min`
  if (is.null(digits) || digits < digits_min) {
    digits <- digits_min
  }

  # Deduplicate rows by variables names in `vars`
  df_distinct <- df[!duplicated(df[, vars]), vars, drop = FALSE]

  #  Add sequential ID numbers to distinct rows
  df_distinct[[id_name]] <- formatC(
    x = seq_start:(seq_start + nrow(df_distinct) - 1),
    width = digits,
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
  # Note: `merge()` converts `df` to data.frame and shuffles row names
  df <- merge(x = df, y = df_distinct, by = vars)

  # Restore row and column order
  df <- df[order(df[[row_order]]), , drop = FALSE]
  df <- df[, c(cn_src, id_name)]

  if (promote) {
    df <- df[, c(id_name, cn_src)]
  }

  df
}
