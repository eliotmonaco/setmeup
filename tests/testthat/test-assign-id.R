test_that("fn works", {
  df <- data.frame(
    row_id = paste0("r", 1:24),
    var1 = rep(LETTERS[1:3], 8),
    var2 = 1:4
  )
  df$var3 <- duplicated(df[, 2:3])
  act <- assign_id(
    df,
    id_name = "id",
    prefix = "id",
    vars = c("var1", "var2"),
    promote = TRUE
  )
  exp <- cbind("id" = rep(sprintf("id%02d", 1:12), 2), df)
  expect_equal(act, exp)
})

test_that("fn works with NA", {
  df <- data.frame(
    row_id = paste0("r", 1:24),
    var1 = rep(LETTERS[1:3], 8),
    var2 = 1:4
  )
  df[c(1, 13), c("var1", "var2")] <- NA
  df[14, "var1"] <- NA
  df$var3 <- duplicated(df[, 2:3])
  act <- assign_id(
    df,
    id_name = "id",
    prefix = "id",
    vars = c("var1", "var2"),
    promote = TRUE
  )
  exp <- cbind("id" = rep(sprintf("id%02d", 1:12), 2), df)
  exp[14, "id"] <- "id13"
  expect_equal(act, exp)
})

test_that("returns df when `length(vars) == 1`", {
  df <- data.frame(x = rep(LETTERS[1:3], 2))
  act <- assign_id(
    df,
    id_name = "id",
    prefix = "id",
    vars = "x",
    promote = TRUE
  )
  exp <- cbind("id" = rep(sprintf("id%01d", 1:3), 2), df)
  expect_equal(act, exp)
})

test_that("`id_name` error", {
  expect_error(
    assign_id(
      data.frame(row_id = 1:3),
      id_name = "row_id"
    ),
    "`row_id` is already a variable in `df`. Choose a different `id_name`."
  )
})

test_that("`seq_start` error", {
  expect_error(
    assign_id(
      data.frame(row_id = 1:3),
      id_name = "id",
      seq_start = -4
    ),
    "`seq_start` must be a positive integer"
  )
})

test_that("wrong input type error", {
  x <- "ID me"
  expect_error(
    assign_id(x, vars = "x", id_name = "id"),
    "`df` must be a dataframe"
  )
})
