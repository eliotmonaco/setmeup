test_that("default dirs & files created", {
  withr::with_tempdir({
    dir.create("my-proj")
    fn_return <- expect_invisible(setup_project(root = "my-proj"))
    dirs_exist <- dir.exists(c(
      "my-proj/data",
      "my-proj/data/1-source",
      "my-proj/data/2-final",
      "my-proj/output",
      "my-proj/scripts"
    ))
    files_exist <- file.exists(c(
      "my-proj/scripts/_output.yml",
      "my-proj/scripts/analysis.Rmd",
      "my-proj/scripts/render.R"
    ))
  })
  expect_true(all(dirs_exist))
  expect_true(all(files_exist))
  expect_equal(fn_return, "my-proj")
})

test_that("default dirs only when rmd = FALSE", {
  withr::with_tempdir({
    dir.create("my-proj")
    fn_return <- expect_invisible(setup_project(root = "my-proj", rmd = FALSE))
    dirs_exist <- dir.exists(c(
      "my-proj/data",
      "my-proj/data/1-source",
      "my-proj/data/2-final",
      "my-proj/output",
      "my-proj/scripts"
    ))
    files_exist <- file.exists(c(
      "my-proj/scripts/_output.yml",
      "my-proj/scripts/analysis.Rmd",
      "my-proj/scripts/render.R"
    ))
  })
  expect_true(all(dirs_exist))
  expect_true(all(!files_exist))
  expect_equal(fn_return, "my-proj")
})
