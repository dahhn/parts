sort_data <- function(){
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
  
  designation_1 <- as.vector(grep("(-\\d{3}-\\d{2})",data_vec, value = FALSE))
  designation_2 <- as.vector(grep("(-\\d{3}-.._.)",data_vec, value = FALSE))
  designation <-sort(c(designation_1, designation_2))
  
  material_no <- as.vector(grep("(\\d{6,10})",data_vec, value = FALSE))
  
  #loop for cleaning and combining designations
  for(i in designation){
    if(i %in% designation_2 == TRUE){
      codes <-c(codes, data_vec[i])
    } else {
      codes <- c(codes,paste0(data_vec[i],data_vec[i+1]))}
  }
  
  count <- 0# this is a general counter to help the sort loop below
  numbers<-as.numeric(grep("\\d",i, value = TRUE))  
  #loop to find numbers
 for(i in material_no){
   material_no <- c(material_no, data_vec[i])
 }

  
  position
  quantity
  material
  codes
  
}

sort_data()




for(i in data_vec){
  if(count!= 3){
    if(is.na(numbers)== FALSE){
      if(count == 0 ){
        position <- c(position, as.numeric(i))
        count <- count+1 
        position
      }
      else if(count == 1 ){
        quantity <- c(quantity, as.numeric(i))
        count <- count+1
        quantity
      }
      else if(count == 2 ){
        material <- c(material, as.numeric(i))
        count <- count+1
        material
      }
    }
  }
}