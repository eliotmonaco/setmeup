# Use an RMD template from this package

This is a wrapper for
[`rmarkdown::draft()`](https://pkgs.rstudio.com/rmarkdown/reference/draft.html).
By default, it copies the relevant files for the "nb1" RMD template into
the `scripts/` folder (created by
[`setup_project()`](https://eliotmonaco.github.io/setmeup/reference/setup_project.md)).

## Usage

``` r
use_rmd_template(filename = "analysis", template = "nb1", dir = "scripts")
```

## Arguments

- filename:

  The file name for the script.

- template:

  The name of the RMD template.

- dir:

  The destination directory.

## Value

`filename` (invisibly).

## Details

The R Notebook template "nb1" has three related files.

- `_output.yml` contains the YAML options under `html_notebook`. These
  will be shared by any markdown documents in the same directory (see
  [Shared Options, R Markdown: The Definitive
  Guide](https://bookdown.org/yihui/rmarkdown/html-document.html#shared-options)).

- `render.R` contains a call to
  [`rmarkdown::render()`](https://pkgs.rstudio.com/rmarkdown/reference/render.html)
  that's prepopulated to execute the notebook and save the `.nb.html`
  report in the project's `output/` directory (created by
  [`setup_project()`](https://eliotmonaco.github.io/setmeup/reference/setup_project.md)).

- `skeleton.Rmd` is the R Notebook file. When `use_rmd_template()` is
  executed, the file will be saved with the name specified in the
  `filename` argument.

## Examples

``` r
if (FALSE) { # \dontrun{
use_rmd_template("my-analysis")
} # }
```
