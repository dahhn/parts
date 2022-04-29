#install.packages("tidyverse")
#install.packages("pdftools")
#install.packages("assertive")
library(assertive)
library(tidyverse)
library(pdftools)

# handy search function that removes chr(0) elements
search <- function(list, reg_express){
    a <- sapply(list, grep, pattern=reg_express, value=TRUE)
    compact(a)
}

#pull data from the pdf and save as vector
v120hub<-pdf_text(paste0(getwd(),"/V120hub.pdf"))

# random page saved for testing.
a <- v120hub[49]


#split up list into individual spaces and words
b<- strsplit(x=a, split=" ")
# regex extracts from y any [didgit, word, or period] as a whole word,
#removes white space
c <- str_extract_all(b, "(\\d|\\w|\\.|\\-|\\+|\\,])+")

#changing to be able to more easily access elements in c
d<-as.list(c[[1]])

#search for all words "\\w" that are not and "n" [^n] multiple times "+"
e<-search(d,"([^n])\\w+")


