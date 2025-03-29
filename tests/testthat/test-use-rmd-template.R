test_that("create template in default `dir`", {
  withr::with_tempdir({
    dir.create("scripts")
    fn_return <- expect_invisible(use_rmd_template("my-analysis"))
    dirs_exist <- dir.exists("scripts")
    files_exist <- file.exists(c(
      "scripts/_output.yml",
      "scripts/render.R",
      "scripts/my-analysis.Rmd"
    ))
  })
  expect_true(all(dirs_exist))
  expect_true(all(files_exist))
  expect_equal(fn_return, "scripts/my-analysis.Rmd")
})

test_that("stop if `dir` doesn't exist", {
  withr::with_tempdir({
    expect_error(
      use_rmd_template("my-analysis"),
      "Folder `scripts` not found"
    )
  })
})
