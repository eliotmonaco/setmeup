test_that("1 vector, in order", {
  x <- 1:3
  act <- is_sorted(x)
  exp <- TRUE
  expect_equal(act, exp)
})

test_that("1 vector, out of order", {
  x <- 3:1
  act <- is_sorted(x)
  exp <- FALSE
  expect_equal(act, exp)
})

test_that("numbers", {
  v1 <- c(-Inf, -Inf, -Inf)
  v2 <- c(0, 0.00000000000000001, 0)
  v3 <- c(-1000000000000, 1000.000001, 100000000000000)
  v4 <- c(NA, 1000, NA)
  v5 <- c(Inf, Inf, Inf)
  act <- is_sorted(v1, v2, v3, v4, v5)
  exp <- c(FALSE, FALSE, TRUE)
  expect_equal(act, exp)
})

test_that("same values", {
  v1 <- 8
  v2 <- 8
  v3 <- 8
  act <- is_sorted(v1, v2, v3)
  exp <- TRUE
  expect_equal(act, exp)
})

test_that("same values", {
  v1 <- "cat"
  v2 <- "dog"
  v3 <- "gibbon"
  act <- is_sorted(v1, v2, v3)
  exp <- TRUE
  expect_equal(act, exp)
})

test_that("dates", {
  d1 <- as.Date(c("1980-08-01", "1988-01-17", "2019-10-25"))
  d2 <- as.Date(c("1980-12-31", "1988-01-17", "2000-12-31"))
  d3 <- as.Date(c("2980-12-31", "1988-01-17", "2020-12-31"))
  act <- is_sorted(d1, d2, d3)
  exp <- c(TRUE, TRUE, FALSE)
  expect_equal(act, exp)
})

test_that("POSIXct", {
  d1 <- as.POSIXct(c(
    "1980-08-01 00:00:00",
    "1988-01-17 00:00:00",
    "2019-10-25 00:00:00"
  ))
  d2 <- as.POSIXct(c(
    "1980-08-01 00:00:01",
    "1988-01-17 00:01:00",
    "2019-10-25 01:00:00"
  ))
  d3 <- as.POSIXct(c(
    "1980-08-01 00:00:02",
    "1988-01-17 00:02:00",
    "2019-10-25 00:20:00"
  ))
  act <- is_sorted(d1, d2, d3)
  exp <- c(TRUE, TRUE, FALSE)
  expect_equal(act, exp)
})

test_that("POSIXct with fractional seconds", {
  d1 <- as.POSIXct(c(
    "1980-08-01 00:00:00",
    "1988-01-17 00:00:00",
    "2019-10-25 00:00:00"
  ))
  d2 <- as.POSIXct(c(
    "1980-08-01 00:00:00.500000",
    "1988-01-17 00:00:00.500000",
    "2019-10-25 00:00:00.500000"
  ))
  d3 <- as.POSIXct(c(
    "1980-08-01 00:00:00.999999",
    "1988-01-17 00:00:00.999999",
    "2019-10-25 00:00:00.499999"
  ))
  act <- is_sorted(d1, d2, d3)
  exp <- c(TRUE, TRUE, FALSE)
  expect_equal(act, exp)
})

test_that("unnequal length error", {
  x <- 1:3
  y <- 2:5
  expect_error(
    is_sorted(x, y),
    "Vectors must be of equal length"
  )
})

