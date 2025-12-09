# Find duplicated rows

Find the duplicated rows in a dataframe.

## Usage

``` r
find_dupes(df, vars)
```

## Arguments

- df:

  A dataframe.

- vars:

  Variables whose values determine which rows are identified as
  duplicates.

## Value

A dataframe consisting of only duplicated rows, or `NULL` if no
duplicates are found

## Details

The output is sorted with duplicate rows adjacent to each other. A
`dupe_id` variable is added which numbers each duplicate set.

## Examples

``` r
df <- data.frame(
  row_id = paste0("r", 1:12),
  x = c(101:104, 101, 112:114, 101:102, 123:124),
  y = rep(LETTERS[1:4], 3)
)

find_dupes(df, vars = c("x", "y"))
#>   row_id   x y dupe_id
#> 1     r1 101 A       1
#> 2     r5 101 A       1
#> 3     r9 101 A       1
#> 4     r2 102 B       2
#> 5    r10 102 B       2
```
