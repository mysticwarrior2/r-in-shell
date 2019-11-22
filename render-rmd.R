#How to run R in the Shell
#November 22, 2019

require("rmarkdown")
require("tidyverse")
require("stringr")

file_names <- commandArgs(trailingOnly = TRUE)

if("-a" %in% file_names){ 
  folder <- file_names[2]
  file_names <- Sys.glob(str_c(folder, "/*.csv"))
  
  if(length(file_names) == 0){
    print("please provide a list of .csv files
          
          to specify all .csv files, use -a and a data directory as input")
  } } else {file_names <- file_names}

#code will look in the designated folder and take all the .csv files and list them
#if not in folder than file names stay file names

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
