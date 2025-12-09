# Assign ID values to distinct dataframe rows

Assign sequential ID values to distinct dataframe rows based on the
variables specified in `vars`.

## Usage

``` r
assign_id(
  df,
  vars,
  id_name,
  prefix = NULL,
  seq_start = 1,
  digits = NULL,
  promote = TRUE
)
```

## Arguments

- df:

  A dataframe.

- vars:

  Variables for determining row uniqueness.

- id_name:

  The name for the ID variable.

- prefix:

  An optional prefix added to all ID values.

- seq_start:

  The start number of the ID sequence.

- digits:

  The number of digits in the ID, including leading zeros. This is used
  when larger than the minimum required.

- promote:

  Logical. If `TRUE`, the ID variable is the first column in the output.

## Value

A dataframe.

## Details

Row names are not preserved.

## Examples

``` r
df <- data.frame(
  var1 = rep(LETTERS[1:3], 4),
  var2 = 1:2
)

assign_id(
  df,
  id_name = "id",
  prefix = "id",
  vars = colnames(df)
)
#>     id var1 var2
#> 1  id1    A    1
#> 2  id2    B    2
#> 3  id3    C    1
#> 4  id4    A    2
#> 5  id5    B    1
#> 6  id6    C    2
#> 7  id1    A    1
#> 8  id2    B    2
#> 9  id3    C    1
#> 10 id4    A    2
#> 11 id5    B    1
#> 12 id6    C    2
```
