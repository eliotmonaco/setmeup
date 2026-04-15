test_that("scalar input", {
  act <- contrast_color("blue")
  exp <- "#FFFFFF"
  expect_equal(act, exp)
})

test_that("vector input", {
  act <- contrast_color(c("black", "white", "#FF0000", "#888"))
  exp <- c("#FFFFFF", "#000000", "#FFFFFF", "#FFFFFF")
  expect_equal(act, exp)
})
