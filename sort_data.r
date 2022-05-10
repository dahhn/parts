sort_data <- function(){
require(tidyverse)
    split_index <- match("Pos",(cleaned_data))
  metadata_vec <- cleaned_data[1:split_index-1]
  data_vec <- cleaned_data[split_index+7:length(cleaned_data)]
  data_vec <- na.omit(data_vec)
  
  
  
  position <- c()
  quantity <- c()
  material <- c()
  description <-c()
  codes <- c()
  remarks <-c()
  # this regex is looking for "-nnn-nn" where n is any number
  designation_indexes_type1 <- as.vector(grep("(-\\d{3}-\\d{2})",data_vec, value = FALSE))
  # this regex is looking for "-nnn-aa_a" where a is any character
  designation_indexes_type2 <- as.vector(grep("(-\\d{3}-.._.)",data_vec, value = FALSE))
  designation <-sort(c(designation_1, designation_2))
  # this regex is looking for any number that is between 6 and 10 digits long
  material_indexes <- as.vector(grep("(\\d{6,10})",data_vec, value = FALSE))
  quantity_indexes <- material_indexes - 1
  position_indexes <- material_indexes - 2
  
  #loop for cleaning and combining designations in the codes vector
for(i in designation){
    if(i %in% designation_2 == TRUE){
      codes <-c(codes, data_vec[i])
    } else {
      codes <- c(codes,paste0(data_vec[i],data_vec[i+1]))}
  }

  #loop for setting material numbers 
for(i in material_indexes){
   material <- c(material, as.numeric(data_vec[i]))
}
#loop for setting quantity numbers  
for(i in quantity_indexes){
  quantity <- c(quantity, as.numeric(data_vec[i]))
}
#loop for setting position numbers 
for(i in position_indexes){
  position <- c(position, as.numeric(data_vec[i]))
}
df <- tibble(material=material,quantity=quantity,codes=codes, position=position)
  
}

sort_data()


df
