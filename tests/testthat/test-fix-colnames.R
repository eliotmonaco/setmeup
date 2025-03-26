test_that("replacements", {
  s <- paste(
    "Some words and stuff plus punctuation",
    ". , : ; ? ! / * @ # - _ \" ' [ ] { } ( )",
    "And symbols",
    "| ` = + ^ ~ < > $",
    "And these",
    "% &",
    "checkThisCamelCase",
    "Letters674next0to827654digits4",
    "THIS/THAT"
  )
  act <- fix_colnames(s)
  exp <- paste0(
    "some_words_and_stuff_plus_punctuation",
    "_or_",
    "and_symbols_",
    "and_these_",
    "check_this_camel_case_",
    "letters_674_next_0_to_827654_digits_4_",
    "this_or_that"
  )
  expect_equal(act, exp)
})

test_that("contains ordinals", {
  s <- c(
    "1st 2nd 3rd 4th 5th 11th 12th 13th 14th 20th 21st 32nd 43rd 54th 900th",
    "1and2"
  )
  act <- fix_colnames(s)
  exp <- c(
    "1st_2nd_3rd_4th_5th_11th_12th_13th_14th_20th_21st_32nd_43rd_54th_900th",
    "1_and_2"
  )
  expect_equal(act, exp)
})
