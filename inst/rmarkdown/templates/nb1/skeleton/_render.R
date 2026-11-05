library(rmarkdown)

input_name <- "analysis" # input file name without extension

output_name <- paste(
  "analysis", # output file name without extension
  format(Sys.Date(), "%Y%m%d"),
  sep = "-"
)

render(
  input = paste0("scripts/", input_name, ".rmd"),
  output_file = output_name,
  output_dir = "output",
  output_options = list(
    self_contained = TRUE
  )
)
