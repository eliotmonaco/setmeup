# Convert a document to another format using Pandoc

Convert a document from one format to another by calling the `pandoc`
system command.

## Usage

``` r
convert_doc(file1, file2)
```

## Arguments

- file1, file2:

  The names of the file to convert and the destination file. Include
  both filename extensions (this is how the "from" and "to" file formats
  are determined).

## Value

A character vector if `file2` is a markdown or typst file, otherwise
`file1` (invisibly).

## Details

Pandoc must be installed. See https://pandoc.org/.

## Examples

``` r
if (FALSE) { # \dontrun{
# Convert from Word to markdown
convert_doc("my-doc.docx", "my-doc.md")
} # }
```
