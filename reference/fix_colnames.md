# Fix column names

Change column names to snake case, remove or replace non-word
characters, and fix duplicates.

## Usage

``` r
fix_colnames(x, n_pfx = NULL)
```

## Arguments

- x:

  A vector of column names.

- n_pfx:

  A prefix added to column names starting with a digit.

## Value

A character vector the same length as `x`.

## Examples

``` r
cols <- c(
  "Messy/Unpleasant Column Names",
  "checkThisCamelCase",
  "Letters674next0to827654digits4",
  "ordinal numbers: 1st 32nd 43rd 54th 900th",
  "this&THAT",
  "THIS/that",
  " Hello, World!!! ",
  "hyphenated-words",
  "words in 'quotes' or even \"quotes\"",
  "ACRONYMThenWord",
  "1"
)

fix_colnames(cols, n_pfx = "n_")
#>  [1] "messy_or_unpleasant_column_names"        
#>  [2] "check_this_camel_case"                   
#>  [3] "letters_674_next_0_to_827654_digits_4"   
#>  [4] "ordinal_numbers_1st_32nd_43rd_54th_900th"
#>  [5] "this_and_that"                           
#>  [6] "this_or_that"                            
#>  [7] "hello_world"                             
#>  [8] "hyphenated_words"                        
#>  [9] "words_in_quotes_or_even_quotes"          
#> [10] "acronym_then_word"                       
#> [11] "n_1"                                     
```
