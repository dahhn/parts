sort_data <- function(cleaned_data){
  split_index <- match("Pos",(cleaned_data)) # index to split data from metadata
  metadata_vec <- cleaned_data[1:split_index-1]
  data_vec <- cleaned_data[split_index+7:length(cleaned_data)]
  data_vec <- na.omit(data_vec)
  
  pg_num <- tail(metadata_vec, 3)
  current_pg <- as.numeric(pg_num[1])
  turbine <- paste(head(metadata_vec, 5), collapse = " ")
  catalog <- metadata_vec[6]
  doc_num <- str_replace(metadata_vec[11], "[-]",".")
  
  #empty Vectors declared to constitute columns of dataframe
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
  designation_indexes <-sort(c(designation_indexes_type1, designation_indexes_type2))
  # this regex is looking for any number that is between 6 and 10 digits long
  material_indexes <- as.vector(grep("(\\d{6,10})",data_vec, value = FALSE))
  quantity_indexes <- material_indexes - 1
  position_indexes <- material_indexes - 2
  
  #loop for cleaning and combining designations in the codes vector
for(i in designation_indexes){
    if(i %in% designation_indexes_type2 == TRUE){
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

#loop for setting description vector
for(i in 1:length(material_indexes)){
    start <- material_indexes[i]
    start <- start+1
    end <- designation_indexes[i]
    end <- end-1
    description <- c(description, paste(data_vec[start:end], collapse = " "))
}
  page_name <- paste0("page.",doc_num,current_pg)
  
assign(page_name, list(
  metadata = list(current_pg=current_pg,
                  catalog=catalog,
                  pg_num=pg_num,
                  doc_num=doc_num,
                  turbine=turbine
                  ),
  pdf_data = tibble(
    material=material,
    codes=codes, 
    position=position, 
    quantity=quantity, 
    description=description)),envir = .GlobalEnv)


}
n<-designation_indexes[16:26]
x <- tibble(material=material,
            #codes=codes, 
            position=position, 
            quantity=quantity, 
            description=description)

