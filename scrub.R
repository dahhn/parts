scrub <- function(item){

clean <- item %>%
  str_replace_all("─","-") %>% #replace boxline with hyphen (-)
  str_replace_all(',', "`") %>% #replace a comma with a backtic
  str_replace_all('(c[[:punct:]])', "") %>% #remove all "c(any_punctuation"
  str_replace_all('[\",)]',"") %>% #remove all double quotes(")
  str_replace_all('  ', "`") %>% #replace all double space with a single backtic (`)
  str_replace_all('`+', "`") %>% #replace multiple backtics(`+) with a single (`)
  str_replace_all('(` )|( `)', "`") %>%#replace backtics with spaces on either side with a single
  str_replace_all("(\\--)",'-') %>% #replaced double (--) with a single (-)
  str_replace_all("(-\\n)","-") %>% #repl. -\\n with a hyphen (-)
  str_replace_all("-`",'-') %>% #repl. a hyphen backtic (-`)with a single hyphen (-)
  str_replace_all("\\.{2,}","`") %>% #repl. replace multiple periods(..) with a single backtic (`)
  str_replace_all("\\n{1,}","~~") %>% #repl. multiple (\n) with a double tilde (~~)
  str_split("~~") 
  
pg_num <- clean %>%
 str_extract("(Page \\d{1,3} of)") %>%
 str_extract("\\d{1,3}") %>%
 unlist() %>%
 as.numeric()
clean <<- set_names(clean, paste0("p",pg_num))

make_toc_dataframe(clean)
}
