scrub <- function(item){
  a <- gsub("─","-",item) #remove box line character and replace with dash
  b <- gsub('[\",)]',"",a) #remove quotes, commas
  c <- gsub('(\\\\n)', " ", b) #remove \\n new line return
  d <- gsub('(c[[:punct:]])', "", c) #remove any c( characters
  e <- gsub(" ", "",d) # remove whitespace
  f <- gsub("(--)$",'-',e)
  scrubbed <- f
  sort_data(scrubbed)
}




