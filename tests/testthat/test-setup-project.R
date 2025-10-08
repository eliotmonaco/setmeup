test_that("analysis with RMD", {
  withr::with_tempdir({
    dir.create("my-proj")
    fn_return <- expect_invisible(
      setup_project(
        root = "my-proj",
        type = "analysis"
      )
    )
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

test_that("analysis without RMD", {
  withr::with_tempdir({
    dir.create("my-proj")
    fn_return <- expect_invisible(
      setup_project(
        root = "my-proj",
        type = "analysis",
        rmd = FALSE
      )
    )
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

test_that("dashboard without RMD", {
  withr::with_tempdir({
    dir.create("my-proj")
    fn_return <- expect_invisible(
      setup_project(
        root = "my-proj",
        type = "dashboard",
        rmd = FALSE
      )
    )
    dirs_exist <- dir.exists(c(
      "my-proj/data",
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
