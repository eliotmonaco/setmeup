test_that("numeric input", {
  act <- pct(
    n = c(0, 1, 2, 3, 4, 5, 6, 7, 8),
    total = c(8, 7, 6, 5, 4, 3, 2, 1, 0),
    digits = 2
  )
  exp <- c(0.00, 14.29, 33.33, 60.00, 100.00, 166.67, 300.00, 700.00, Inf)
  expect_equal(act, exp)
})

test_that("lists of various classes", {
  act <- suppressWarnings(pct(
    n = list(0, 1, "2", 3, 4, "5", 6, "A", TRUE),
    total = list(FALSE, "B", "6", 5, "4", 3, 2, 1, 0),
    digits = 1
  ))
  exp <- c(NaN, NA, 33.3, 60.0, 100.0, 166.7, 300.0, NA, Inf)
  expect_equal(act, exp)
})

test_that("length of `total` is 1", {
  act <- pct(
    n = c(1, 2, 3, 4),
    total = 12,
    digits = 1
  )
  exp <- c(8.3, 16.7, 25.0, 33.3)
  expect_equal(act, exp)
})

test_that("length of `n` is 1", {
  act <- pct(
    n = 12,
    total = c(1, 2, 3, 4)
  )
  exp <- c(1200, 600, 400, 300)
  expect_equal(act, exp)
})

test_that("unequal length error", {
  expect_error(
    pct(
      n = c(1, 2, 3, 4),
      total = c(1, 2)
    ),
    paste(
      "The lengths of `n` & `total` must be equal",
      "or one must be of length 1"
    )
  )
})

test_that("formatted output", {
  sq <- seq(-8, 8, 4)
  act <- data.frame(
    digneg1 = pct(n = sq, total = 100, digits = -1, format = TRUE),
    dig0 = pct(n = sq, total = 1000, digits = 0, format = TRUE),
    dig1 = pct(n = sq, total = 10000, digits = 1, format = TRUE),
    dig2 = pct(n = sq, total = 100000, digits = 2, format = TRUE)
  )
  exp <- data.frame(
    digneg1 = c("-10%", "> -10%", "0%", "< 10%", "10%"),
    dig0 = c("-1%", "> -1%", "0%", "< 1%", "1%"),
    dig1 = c("-0.1%", "> -0.1%", "0%", "< 0.1%", "0.1%"),
    dig2 = c("-0.01%", "> -0.01%", "0%", "< 0.01%", "0.01%")
  )
  expect_equal(act, exp)
})
