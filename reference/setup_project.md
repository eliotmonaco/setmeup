# Setup project structure

Create subdirectories for an R project.

## Usage

``` r
setup_project(
  root = getwd(),
  type = c("analysis", "dashboard"),
  dirs = NULL,
  rmd = TRUE
)
```

## Arguments

- root:

  The project root directory (defaults to the current working
  directory).

- type:

  The type of project to create (`"analysis"` or `"dashboard"`).

- dirs:

  The subdirectories to create, as a character vector. The defaults are
  described in the Details section.

- rmd:

  Call
  [`use_rmd_template()`](https://eliotmonaco.github.io/setmeup/reference/use_rmd_template.md)
  if TRUE (with defaults only, currently).

## Value

`root` (invisibly).

## Details

### Default subdirectories created under `root`

For `type = "analysis"`:

- `data/`

  - `1-source/`: Unmodified source data files originating outside of the
    project.

  - `2-final/`: Final data products (native R formats only).

- `output/`: Outputs for consumption outside R (e.g., CSV, XLSX, XML,
  HTML, PDF).

- `scripts/`: All script files (e.g., R, RMD, QMD).

For `type = "dashboard"`:

- `data/`: All data files.

- `scripts/`: All script files (e.g., R, RMD, QMD).

Directories are created recursively by
[`base::dir.create()`](https://rdrr.io/r/base/files2.html).

## Examples

``` r
if (FALSE) { # \dontrun{
setup_project(type = "analysis")
} # }
```
