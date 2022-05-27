## toc = Table of Contents
make_toc_dataframe <- function(pdf_list){
  #look for which page has "Table of Contents"
    start_page <- index_grep(pdf_list,"Table of Contents")
    #get the first page to search 
    first_pg <- pdf_list[start_page] %>% unlist()
    #find the index of 'introduction' on first page
    intro <- first_pg %>% index_grep(.,"Introduction")
    
    end_page <- intro - 1
    
    toc_pages <- pdf_list[start_page:end_page] %>% unlist
    x <- toc_pages %>% str_trim() %>% str_split('`') 
    #x <- first_pg %>% str_trim() %>% str_split('`') #split vectors at backtics
    y <- x[intro:length(x)]#removes extra entries at the beginning
    
    #declare empty dataframe for table of contentse
    toc_df <- tibble(section = character(),
                     description = character(),
                     module_number = numeric(),
                     page = numeric()) 
    
    for (i in y ) {
      toc_df <- toc_df %>% add_row( section = i[1],
                                    description = i[2],
                                    module_number = as.numeric(i[3]),
                                    page = as.numeric(i[4]))}
    doc_namer(toc_df,"table_of_contents_")
    #make_parts_dataframe(pdf_list[])
}
