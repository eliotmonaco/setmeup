test_that("fn works", {
  df <- data.frame(
    row_id = paste0("r", 1:12),
    x = c(101:104, 101, 112:114, 101:102, 123:124),
    y = rep(LETTERS[1:4], 3)
  )
  act <- find_dupes(df, vars = c("x", "y"))
  exp <- df[c(1, 5, 9, 2, 10), ]
  exp$dupe_id <- c(1, 1, 1, 2, 2)
  rownames(exp) <- 1:nrow(exp)
  expect_equal(act, exp)
})

test_that("no dupes", {
  df <- data.frame(x = 1:3, y = letters[1:3])
  expect_null(find_dupes(df, var = c("x", "y")))
})

test_that("wrong input type error", {
  x <- "deduplicate me"
  expect_error(
    find_dupes(x, var = "x"),
    "`df` must be a dataframe"
  )
})

test_that("rename `dupe_id`", {
  df <- data.frame(
    dupe_id = paste0("r", 1:12),
    x = c(101:104, 101, 112:114, 101:102, 123:124),
    y = rep(LETTERS[1:4], 3)
  )
  act <- find_dupes(df, vars = c("x", "y"))
  id_var <- paste("dupe_id", Sys.time()) |>
    gsub(pattern = "\\s", replacement = "_")
  exp <- df[c(1, 5, 9, 2, 10), ]
  exp[[id_var]] <- c(1, 1, 1, 2, 2)
  rownames(exp) <- 1:nrow(exp)
  # Remove time after hours from dupe ID column names
  colnames(act) <- sub(":.*", "", colnames(act))
  colnames(exp) <- sub(":.*", "", colnames(exp))
  expect_equal(act, exp)
})
