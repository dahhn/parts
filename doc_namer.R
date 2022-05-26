doc_namer <- function(document, prefix){
  doc_name <- document %>% str_extract("(Document number: \\d{4}.\\d{4})") %>%
    str_extract('(\\d{4}.\\d{4})') %>%
    str_replace('\\-', "_") %>%
    paste0(prefix,.)
  if (is.data.frame(document)) {
    document <- document %>% filter(is.na(page) == FALSE) 
  }
  assign(doc_name, document, envir = .GlobalEnv)
}
