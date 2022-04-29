scrub <- function(my_pdf){
  require(tidyverse)
  require(pdftools)
  
  # handy search function that searches a list for specfic patterns and removes chr(0) elements
  search <- function(list, reg_express){
    #search feature
    a <- sapply(list, grep, pattern=reg_express, value=TRUE)
    #remove chr(0) elements
    compact(a)
  }
}