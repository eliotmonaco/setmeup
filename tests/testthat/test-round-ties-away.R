test_that("rounding, `digits` = 0", {
  x <- seq(-2.5, 2.5, by = 0.5)
  act <- round_ties_away(x)
  exp <- c(-3, -2, -2, -1, -1, 0, 1, 1, 2, 2, 3)
  expect_equal(act, exp)
})

test_that("rounding, `digits` = 2", {
  x <- seq(-0.025, 0.025, by = 0.005)
  act <- round_ties_away(x, digits = 2)
  exp <- c(-0.03, -0.02, -0.02, -0.01, -0.01, 0, 0.01, 0.01, 0.02, 0.02, 0.03)
  expect_equal(act, exp)
})

test_that("rounding, `digits` = -2", {
  x <- seq(-250, 250, by = 50)
  act <- round_ties_away(x, digits = -2)
  exp <- c(-300, -200, -200, -100, -100, 0, 100, 100, 200, 200, 300)
  expect_equal(act, exp)
})

test_that("`digits` error, length > 1", {
  expect_error(
    round_ties_away(x = -0.125, digits = c(1, 2)),
    "`digits` must be a single integer"
  )
})

test_that("`digits` is character", {
  expect_error(
    round_ties_away(x = -0.125, digits = "-2"),
    "`digits` must be a single integer"
  )
})

test_that("`digits` is double", {
  expect_error(
    round_ties_away(x = -0.125, digits = 2.5),
    "`digits` must be a single integer"
  )
})
