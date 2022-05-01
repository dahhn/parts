item_parse <- function(item){
  a <- gsub("─","-",item) #remove box line character and replace with dash
  b <- gsub('[\",)]',"",a) #remove quotes, commas
  c <- gsub('(\\\\n)', " ", b) #remove \\n new line return
  d <- gsub('(c[[:punct:]])', "", c) #remove any c( characters
  d
}

item_parse(f[1:100])



