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
