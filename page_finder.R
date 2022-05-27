# searched through dataframe and returns the page number
page_finder <- function(dataframe, search_phrase=character()){
  assert_is_data.frame(dataframe) 
  x <- which(dataframe == search_phrase,arr.ind = TRUE) %>%
    as_tibble() %>%
    select(row) %>%
    as.numeric()
 dataframe[x,] %>% select(page) %>% as.numeric() 
}




  #x <-which(toc_df=="2.3",arr.ind = TRUE)%>% as_tibble()%>%select(row)%>%as.numeric()
  #toc_df[x,]%>%select(page)
