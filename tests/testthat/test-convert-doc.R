test_that("conversion experience", {
  f1 <- normalizePath(test_path("fixtures", "convert.md"))

  withr::with_tempdir({
    file.copy(f1, "convert.md")

    doc <- suppressWarnings(convert_doc(
      "convert.md",
      "new.docx"
    ))

    file_exists <- file.exists("new.docx")
  })

  expect_true(file_exists)
})

test_that("filenames equal error", {
  expect_error(
    withr::with_tempdir(convert_doc("doc1.md", "doc1.md")),
    "`file1` and `file2` cannot have the same name"
  )
})

test_that("unrecognized extension error", {
  expect_error(
    withr::with_tempdir(convert_doc("doc1.xyz", "doc1.md")),
    "\"xyz\" isn't a recognized filename extension"
  )
})
