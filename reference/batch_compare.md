# Pairwise comparisons between list elements

Compare all list elements, producing a logical matrix with the result of
each pairwise comparison. Row and column names are taken from
`names(ls)`.

## Usage

``` r
batch_compare(ls)
```

## Arguments

- ls:

  A list or atomic vector of objects to compare.

## Value

A logical matrix with a number of rows and columns equal to
`length(ls)`.

## Examples

``` r
ls <- list(
  var1 = "a",
  var2 = 1,
  var3 = c("a", "b"),
  var4 = 1
)

batch_compare(ls)
#>       var1  var2  var3  var4
#> var1  TRUE FALSE FALSE FALSE
#> var2 FALSE  TRUE FALSE  TRUE
#> var3 FALSE FALSE  TRUE FALSE
#> var4 FALSE  TRUE FALSE  TRUE
```
