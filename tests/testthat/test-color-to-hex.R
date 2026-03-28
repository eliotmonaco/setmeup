test_that("names in, 6-digit hex out", {
  act <- color_to_hex(c("blue", "white"))
  exp <- c("#0000FF", "#FFFFFF")
  expect_equal(act, exp)
})

test_that("names and 1 alpha in, 8-digit hex out", {
  act <- color_to_hex(c("blue", "white"), alpha = .5)
  exp <- c("#0000FF7F", "#FFFFFF7F")
  expect_equal(act, exp)
})

test_that("names and 2 alphas in, 8-digit hex out", {
  act <- color_to_hex(c("blue", "white"), alpha = c(.5, 1))
  exp <- c("#0000FF7F", "#FFFFFFFF")
  expect_equal(act, exp)
})

test_that("name, hex, and alphas in, 8-digit hex out", {
  act <- color_to_hex(c("lightgreen", "#90EE90"), alpha = c(.2, .4))
  exp <- c("#90EE9033", "#90EE9066")
  expect_equal(act, exp)
})

test_that("name and hex in, rgba out", {
  act <- color_to_css_rgba(c("red", "#FF0000"))
  exp <- c("rgba(255,0,0,1)", "rgba(255,0,0,1)")
  expect_equal(act, exp)
})

test_that("name, hex, and alpha in, rgba out", {
  act <- color_to_css_rgba(c("red", "#FF0000"), alpha = c(.2, .4))
  exp <- c("rgba(255,0,0,0.2)", "rgba(255,0,0,0.4)")
  expect_equal(act, exp)
})
