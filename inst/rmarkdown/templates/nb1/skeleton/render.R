rmd_name <- "" # RMD file name goes here

rmarkdown::render(
  input = paste0("scripts/", rmd_name, ".rmd"),
  output_file = paste(
    rmd_name,
    format(Sys.time(), "%Y-%m-%d"),
    sep = "-"
  ),
  output_dir = "output"
)
