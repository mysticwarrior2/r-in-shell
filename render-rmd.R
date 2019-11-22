#How to run R in the Shell
#November 22, 2019

require("rmarkdown")
require("tidyverse")
require("stringr")

file_names <- commandArgs(trailingOnly = TRUE)

for (file in file_names)
{

out_name <- str_split_fixed(string = file,
                            pattern = "[/|.]",
                            n = 3)  #this command is saying that strings will be 
                                    #split at the dash, and period
                                    #then these should be recognized as 3 parts
out_name <- str_c(out_name[2], '.html')

render("surveys-report.Rmd",
       output_file = out_name,
       output_dir = "reports",
       params = list(file = file)) 
}
