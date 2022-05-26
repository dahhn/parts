index_grep <- function(my_data, regex){
  if (is.data.frame(my_data)) {
    my_data <- my_data %>% grepl(regex,.) 
  } 
  grepl(regex, my_data) %>%
    which() %>%
    as.numeric()
}
