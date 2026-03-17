test_that("table output", {
  act <- data.frame(
    x = c(
      "One line of text   ",
      "This text should be on 2 lines"
    ),
    y = c(
      "This text should be on 4 lines don't you know alright now",
      "   One line of text"
    )
  )
  act <- readable_table(act, width = 16)
  exp <- data.frame(
    x = c(
      "One line of text", "                ", "                ", "                ",
      "This text should", "be on 2 lines   "
    ),
    y = c(
      "This text should", "be on 4 lines   ", "don't you know  ", "alright now     ",
      "One line of text", "                "
    )
  )
  colnames(exp) <- c("x               ", "y               ")
  expect_equal(act, exp)
})
