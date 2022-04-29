#install.packages("tidyverse")
#install.packages("pdftools")
#install.packages("assertive")
library(assertive)
library(tidyverse)
library(pdftools)

# handy search function that searches a list for specfic patterns and removes chr(0) elements
search <- function(list, reg_express){
    #search feature
    a <- sapply(list, grep, pattern=reg_express, value=TRUE)
    #remove chr(0) elements
    compact(a)
}

replace <- function(list, reg_express){
  a <- sapply(list, gsub, pattern=reg_express, replacement= new_text, value=TRUE)
  compact(a)
}

#pull data from the pdf and save as vector
v120hub<-pdf_text(paste0(getwd(),"/V120hub.pdf"))

# random page saved for testing.
a <- v120hub[49]

#split up list into individual spaces and words
b<- strsplit(x=a, split=" ")
# regex extracts from y any [digit, word, or period, dash (-), + or line like character {2500}] as a whole word and removes white space
c <- str_extract_all(b, "(\\d|\\w|\\.|\\-|\\+|\\x{2500})+")

#changing to be able to more easily access elements in c
d<-as.list(c[[1]])

#search for all words "\\w" that are not and "n" [^n] multiple times "+"
e<-search(d,"([^n])\\w+")

# search for any dash like characters, word characters 
f <- search(e, "\\x{2500}|\\w")

# looks for any number that is between 6 and 9 didgits
search(f, "\\d{6,9}")
# search for any non-digit character
search(f, "\\D")
# search for the column names
search(f, "Pos|Qty|Material|Description|Codes|Remarks")


