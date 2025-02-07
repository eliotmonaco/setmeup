test_that("numeric vector input", {
  act <- pct(
    n = c(0, 1, 2, 3, 4, 5, 6, 7, 8),
    total = c(8, 7, 6, 5, 4, 3, 2, 1, 0),
    digits = 2
  )
  exp <- c(0.00, 14.29, 33.33, 60.00, 100.00, 166.67, 300.00, 700.00, Inf)
  expect_equal(act, exp)
})

test_that("lists containing multiple classes", {
  act <- suppressWarnings(pct(
    n = list(0, 1, "2", 3, 4, "5", 6, "A", TRUE),
    total = list(FALSE, "B", "6", 5, "4", 3, 2, 1, 0)
  ))
  exp <- c(NaN, NA, 33.3, 60.0, 100.0, 166.7, 300.0, NA, Inf)
  expect_equal(act, exp)
})

test_that("vectors of unequal length", {
  act <- pct(
    n = c(1, 2, 3, 4),
    total = 12
  )
  exp <- c(8.3, 16.7, 25.0, 33.3)
  expect_equal(act, exp)
})

test_that("vectors of unequal length (error)", {
  expect_error(
    pct(
      n = c(1, 2, 3, 4),
      total = c(1, 2)
    ),
    paste0(
      "When the lengths of `n` & `total` are unequal, the shorter vector must ",
      "have length of 1 to be recycled"
    )
  )
})
