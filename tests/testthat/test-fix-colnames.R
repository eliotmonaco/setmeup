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
