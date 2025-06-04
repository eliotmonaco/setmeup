test_that("returns matrix", {
  ls <- list(
    var1 = "a",
    var2 = 1,
    var3 = c("a", "b"),
    var4 = 1
  )
  act <- batch_compare(ls)
  exp <- matrix(
    rbind(
      c(T, F, F, F),
      c(F, T, F, T),
      c(F, F, T, F),
      c(F, T, F, T)
    ),
    nrow = 4, ncol = 4,
    dimnames = list(names(ls), names(ls))
  )
  expect_equal(act, exp)
})

test_that("non-list error", {
  expect_error(
    batch_compare(data.frame(x = letters)),
    "`ls` is not a list or atomic vector"
  )
})
