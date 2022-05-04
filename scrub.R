scrub <- function(item){
  a <- gsub("─","-",item) #remove box line character and replace with dash
  b <- gsub('[\",)]',"",a) #remove quotes, commas
  c <- gsub('(\\\\n)', " ", b) #remove \\n new line return
  d <- gsub('(c[[:punct:]])', "", c) #remove any c( characters
  e <- gsub(" ", "",d) # remove whitespace
  cleaned_data <<- e
  cleaned_data
}

item_parse(f)



