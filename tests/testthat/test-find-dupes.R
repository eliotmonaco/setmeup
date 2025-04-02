test_that("fn works", {
  df <- data.frame(
    row_id = paste0("r", 1:12),
    var1 = rep(LETTERS[1:4], 3),
    var2 = c(1:4, 1, 12:14, 1:2, 23:24)
  )
  act <- find_dupes(df, vars = c("var1", "var2"))
  exp <- df[c(1, 5, 9, 2, 10), ]
  exp$dupe_id <- c(1, 1, 1, 2, 2)
  rownames(exp) <- 1:nrow(exp)
  expect_equal(act, exp)
})
