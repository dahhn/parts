
# handy search function that searches a list for specfic patterns and removes chr(0) elements
search <- function(list, reg_express, value){
  #search feature
  a <- sapply(list, grep, pattern=reg_express, value=value)
  #remove chr(0) elements
  compact(a)
}