test_that("fn works", {
  withr::with_tempdir({
    dir.create("my-proj")
    fn_return <- expect_invisible(setup_project_structure("my-proj"))
    dirs_exist <- dir.exists(c(
      "my-proj/data",
      "my-proj/data/1-source",
      "my-proj/data/2-aux",
      "my-proj/data/3-final",
      "my-proj/output",
      "my-proj/scripts"
    ))
  })
  expect_true(all(dirs_exist))
  expect_equal(fn_return, "my-proj")
})
