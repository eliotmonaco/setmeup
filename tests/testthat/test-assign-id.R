test_that("works normally", {
  df <- data.frame(
    row_id = paste("r", 1:24),
    a = rep(c("a", "b", "c"), times = 8),
    b = c(1, 1, 2, 2),
    c = c(TRUE, FALSE)
  )
  act <- assign_id(
    df,
    id_name = "id",
    prefix = "id",
    vars = c("a", "b", "c"),
    promote = TRUE
  )
  exp <- cbind(
    rep(sprintf("id%02d", 1:12), 2),
    df
  )
  names(exp)[1] <- "id"
  rownames(act) <- NULL
  rownames(exp) <- NULL
  expect_equal(act, exp)
})

test_that("works with removed rows", {
  df <- data.frame(
    row_id = paste("r", 1:24),
    a = rep(c("a", "b", "c"), times = 8),
    b = c(1, 1, 2, 2),
    c = c(TRUE, FALSE)
  )
  df <- df[-c(2, 4, 6, 8, 10), ]
  act <- assign_id(
    df,
    id_name = "id",
    prefix = "id",
    vars = c("a", "b", "c"),
    promote = TRUE
  )
  exp <- cbind(
    c(
      sprintf("id%02d", 1:7),
      "id01", "id08", "id02",
      "id09", "id03", "id10",
      "id04", "id11", "id05",
      "id12", "id06", "id07"
    ),
    df
  )
  names(exp)[1] <- "id"
  rownames(act) <- NULL
  rownames(exp) <- NULL
  expect_equal(act, exp)
})

test_that("works with assigned row names", {
  df <- data.frame(
    row_id = paste("r", 1:24),
    a = rep(c("a", "b", "c"), times = 8),
    b = c(1, 1, 2, 2),
    c = c(TRUE, FALSE)
  )
  rownames(df) <- paste0("r", rownames(df))
  act <- assign_id(
    df,
    id_name = "id",
    prefix = "id",
    vars = c("a", "b", "c"),
    promote = TRUE
  )
  exp <- cbind(
    rep(sprintf("id%02d", 1:12), 2),
    df
  )
  names(exp)[1] <- "id"
  rownames(act) <- NULL
  rownames(exp) <- NULL
  expect_equal(act, exp)
})

test_that("works with 1 column input", {
  df <- data.frame(x = rep(c("a", "b", "c"), 2))
  act <- assign_id(
    df,
    id_name = "id",
    prefix = "id",
    vars = "x",
    promote = TRUE
  )
  exp <- cbind(
    rep(sprintf("id%01d", 1:3), 2),
    df
  )
  names(exp)[1] <- "id"
  rownames(act) <- NULL
  rownames(exp) <- NULL
  expect_equal(act, exp)
})

test_that("produces `id_name` exists error", {
  df <- data.frame(
    row_id = paste("r", 1:24),
    a = rep(c("a", "b", "c"), times = 8),
    b = c(1, 1, 2, 2),
    c = c(TRUE, FALSE)
  )
  expect_error(
    assign_id(df, id_name = "row_id"),
    "`row_id` is already a variable in `df`. Choose a different `id_name`."
  )
})
