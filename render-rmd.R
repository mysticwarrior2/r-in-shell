#How to run R in the Shell
#November 22, 2019

require("rmarkdown")
require("tidyverse")

file_names <- commandArgs(trailingOnly = TRUE)

render("surveys-report.Rmd",
       output_dir = "reports",
       params = list(file = file_names)) 

