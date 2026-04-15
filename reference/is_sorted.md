# Check if values are sorted

Check if elements across multiple vectors are sorted index-wise, or, if
vectors are dataframe columns, row-wise.

## Usage

``` r
is_sorted(...)
```

## Arguments

- ...:

  One vector, or multiple vectors of the same length.

## Value

If there is one input, a logical value. If there are multiple inputs, a
logical vector the same length as the inputs.

## Details

Any number of vectors can be compared. If the input is a single vector,
the order of elements in that vector is checked. However, if the input
is multiple vectors, the order of elements across all vectors at each
index is checked. `NA`s are ignored.

## Examples

``` r
is_sorted(letters)
#> [1] TRUE

is_sorted(rev(letters))
#> [1] FALSE

x <- 1:5
y <- c(2, 3, NA, 0, 5)
is_sorted(x, y)
#> Warning: Vectors are not the same class
#> [1]  TRUE  TRUE  TRUE FALSE  TRUE

df <- data.frame(
  d1 = seq.Date(
    as.Date("1980-01-01"),
    as.Date("1980-12-31"),
    by = "month"
  ),
  d2 = seq.Date(
    as.Date("1990-01-01"),
    as.Date("1990-12-31"),
    by = "month"
  ),
  d3 = seq.Date(
    as.Date("1985-01-01"),
    as.Date("1996-01-01"),
    by = "year"
  )
)

df$sorted <- is_sorted(df$d1, df$d2, df$d3)

df
#>            d1         d2         d3 sorted
#> 1  1980-01-01 1990-01-01 1985-01-01  FALSE
#> 2  1980-02-01 1990-02-01 1986-01-01  FALSE
#> 3  1980-03-01 1990-03-01 1987-01-01  FALSE
#> 4  1980-04-01 1990-04-01 1988-01-01  FALSE
#> 5  1980-05-01 1990-05-01 1989-01-01  FALSE
#> 6  1980-06-01 1990-06-01 1990-01-01  FALSE
#> 7  1980-07-01 1990-07-01 1991-01-01   TRUE
#> 8  1980-08-01 1990-08-01 1992-01-01   TRUE
#> 9  1980-09-01 1990-09-01 1993-01-01   TRUE
#> 10 1980-10-01 1990-10-01 1994-01-01   TRUE
#> 11 1980-11-01 1990-11-01 1995-01-01   TRUE
#> 12 1980-12-01 1990-12-01 1996-01-01   TRUE
```
