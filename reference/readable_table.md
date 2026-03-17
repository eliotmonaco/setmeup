# Make a readable table

Transform a dataframe so that it can be written to a text file as an
easily readable table. Row names are not preserved.

## Usage

``` r
readable_table(df, width)
```

## Arguments

- df:

  A dataframe.

- width:

  The maximum width of each column.

## Value

A dataframe.

## Examples

``` r
df <- data.frame(
  x = c(
    "One line of text   ",
    "This text should be on 2 lines"
  ),
  y = c(
    "This text should be on 4 lines etc etc etc etc etc etc",
    "   One line of text"
  )
)

df2 <- readable_table(df, width = 16)

if (FALSE) { # \dontrun{
write.table(
  df2,
  file = "readable-table-example.txt",
  sep = "\t",
  quote = FALSE,
  row.names = FALSE
)
} # }
```
