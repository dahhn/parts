extract_pdf_data <- function(page_number){
  #pull data from the pdf and save as vector
  v120hub<-pdf_text(paste0(getwd(),"/V120hub.pdf"))
  # random page saved for testing.
  a <- v120hub[page_number]
  #split up list into individual spaces and words
  b<- strsplit(x=a, split=" ")
  # regex extracts from y any [digit, word, or period, dash (-), + or line like character {2500}] as a whole word and removes white space
  #c <- str_extract_all(b, "[\\d|\\w|\\.|\\-|\\n|\\+|\\x{2500}]+")  --- will remove later. Saving for now
  c <- str_extract_all(b, "(\\S)+")
  #changing to be able to more easily access elements in c
  d<-as.list(c[[1]])
  #search for all words "\\w" that are not and "n" [^n] multiple times "+"
  e<-search(d,"([^n])\\w+", value = TRUE)
  # search for any dash like characters, word characters 
  f <- search(e, "\\x{2500}|\\w", value= TRUE)
  extracted_data <- f
  scrub(extracted_data)
}
