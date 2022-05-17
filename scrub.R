scrub <- function(item){

clean <-item%>%
  str_replace_all("─","-")%>% #replace boxline with dash
  str_replace_all(',', "`")%>%
  str_replace_all('(c[[:punct:]])', "")%>% #remove all "c(punctuation"
  str_replace_all('[\",)]',"")%>% #remove all "
  str_replace_all('  ', "`")%>% #replace all double space with a single ` backtic
  str_replace_all('`+', "`")%>%
  str_replace_all('(` )|( `)', "`")%>%
  str_replace_all("(\\--)",'-')%>%
  str_replace_all("(-\\n)","-")%>%
  str_replace_all("-`",'-')%>%
  str_replace_all("\\.{2,}","`")%>%
  str_replace_all("\\n{1,}","~~")%>%
  str_split("~~")
  
pg_num <- clean %>%
 str_extract("(Page \\d{1,3} of)")%>%
 str_extract("\\d{1,3}") %>%
 unlist()%>%
 as.numeric()
clean<-set_names(clean, paste0("p",pg_num))

doc_name <- clean[1] %>% str_extract("(Document number: \\d{4}.\\d{4})")%>%
  str_extract('(\\d{4}.\\d{4})')%>%
  str_replace('\\-', "_") %>%
  paste0("doc_",.)
assign(doc_name, clean, envir = .GlobalEnv)
}


######
###### TEST CODE BELOW

#page_num <- clean %>%
  #str_extract("(Page \\d{1,3} of)") %>%
  #str_extract("\\d{1,3}") %>%
 # unlist()%>%
 # as.numeric() 
#clean<-set_names(clean, paste0("p",page_num))

#str_replace_all("(\\\\n)|\\n', ", "***")%>%
#str_replace_all('(c[[:punct:]])', "")%>%
#str_replace_all(" ", "")%>%
#str_replace_all("(--)$",'-')

#str_replace_all('(\\\\n)|\\n', "***")%>%
#str_replace_all('\\.\\.', "")%>%
#str_replace_all('   ', "`")%>%
#str_replace_all("\\*{4}","")%>%
#str_replace_all("\\,", "")%>%
#str_split("(\\*{3}|\\*{2})")
#str_replace_all("\\*","")

#clean <- clean %>%
 # str_replace_all('(\\\\n)|\\n', "***")%>%
  #str_replace_all('\\.\\.', "")%>%
  #str_replace_all('   ', "`")%>%
  #str_replace_all("\\*{4}","")%>%
  #str_replace_all("\\,", "")%>%
  #str_split("(\\*{3}|\\*{2})")
#str_replace_all("\\*","")%>%
 # clean 


#a <- gsub("─","-",item) #remove box line character and replace with dash
#b <- gsub('[\",)]',"",a) #remove quotes, commas
#c <- gsub('(\\\\n)|\\n', " ", b) #remove \\n new line return
#d <- gsub('(c[[:punct:]])', "", c) #remove any c( characters
#e <- gsub(" ", "",d) # remove whitespace
#f <- gsub("(--)$",'-',e)

  #clean[2] <- page

#page <- clean[2]

#page <- unlist(page)

#page<-page[! page %in% c("")]

#page1

#num <- max(unlist(lapply(x, length)))  ## Length of the longest vector in x

#lapply(seq(num), function(i) unlist(lapply(x, `[`, i)))


#lapply(x,grep)

#sort_data(scrubbed)




