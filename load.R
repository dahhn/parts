#install.packages("tidyverse")
#install.packages("pdftools")
inst_pack <- function(){
  library(tidyverse)
  library(pdftools)
  library(assertive)
  #library(assertive)
  #library(data.table)
}
inst_pack()
v120hub<-pdf_text(paste0(getwd(),"/V120hub.pdf"))
scrub(v120hub)



  

