test_that("date order", {
  d1 <- as.Date(c("1980-08-01", "1988-01-17", "2019-10-25"))
  d2 <- as.Date(c("1980-12-31", "1988-01-17", "2000-12-31"))
  d3 <- as.Date(c("2980-12-31", "1988-01-17", "2020-12-31"))
  act <- check_date_order(d1, d2, d3)
  exp <- c(TRUE, TRUE, FALSE)
  expect_equal(act, exp)
})
