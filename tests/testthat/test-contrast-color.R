test_that("function works", {
  act <- contrast_color(c("black", "white", "#FF0000", "#888"))
  exp <- c("#FFFFFF", "#000000", "#FFFFFF", "#FFFFFF")
  expect_equal(act, exp)
})
