#build_dataframe <- function(cleaned_data){
  #### This takes cleaned data from item_parse() and builds a dataframe row by row as well as capturing metadata
document <- list(metadata = list(turbine="character",
                            doc_description="character",
                            doc_num="character",
                            version_description="character",
                            last_page='number'),
           data = tibble(position="number",
                         quantity="number",
                         material_no="number",
                         description="character",
                         remarks="character",
                         current_page="number",
                         id_num = "number"),
           funcs = list())               


#look for entries that matches the following: Pos, Qty, Material, Description, Codes, Remarks

  #record position for Pos as 'split_here'
split_index <- match("Pos",(cleaned_data))  
  #take data at 'split_here' -1 and assign as a list called 'metadata'
metadata_vec <- cleaned_data[1:split_index-1]
    #metadata:
      #turbine: concatanate first several entries: 'v116/120 2.2 Mw Mk 11D'
      #doc_description: concatanate next entries: 'Hub Illustrated Part Catalogue Document Number:'
      #doc_number: 0000-0000 or 000000 format.
      #version_description: 'Version 00. Class: restricted, Type:T09, Date: some_date'
      #current_page: as.number( 49) skip "of"
      #last_page: as.number(126)
      ###### More metadata will need to be added for linking pages, parent material numbers and other things as needed
      ###### this metadata might be best as a totally separate list or dataframe that is linked to the entries below.
#the rest of the data to be processed stored as data_vec
data_vec <- cleaned_data[split_index+7:length(cleaned_data)]  
  #look for the first occurance of 3 digit number after split_here. add them to column Pos
  #change to as.Number()

############
# looks for any number that is between 6 and 9 digits
#part_num <- search(data_vec, "\\d{6,9}", value=TRUE)
# search for any non-digit character
#search(data_vec, "\\D", value=TRUE)
# search for the column names
############
data_vec <- na.omit(data_vec)


count <- c()
position <- c()
quantity <- c()
material <- c()
description <-c()
codes <- c()
remarks <-c()

for(i in data_vec){
  numbers<-as.numeric(grep("\\d",i, value = TRUE))
  designation <- grep("(-\\d{3})",i, value = FALSE)
  
  if(count<3){
            if(is.na(numbers)== FALSE){
            if(count == 0 ){
                    position <- c(position, as.numeric(i))
                    count <- count+1 
            }
            else if(count == 1 ){
                    quantity <- c(quantity, as.numeric(i))
                    count <- count+1 
            }
            else if(count == 2 ){
                    material <- c(material, as.numeric(i))
                    count <- count+1
            }
            }
  }
    
}

######



numbers<-as.numeric(grep("\\d",i, value = TRUE))

designation
paste(data_vec[9],data_vec[10])
data_vec[18]
#designation <- grep("(-\\d{3})",data_vec[1], value = FALSE)

#description <- c(description, data_vec[6])

  #look for next entry. Should be a 3 digit number at max. add to Qty column as.Number()

  #look for next entry. Should be a 6-10 digit number. add to Material column as.Number()
  
  #look for next entries. should be a series of strings. add to Description column as.List()
  
  #look for next two entries. First should start with '-' concat the two together. add to Codes column
  
  #look for next entries that are not a 1-3 digit number add to Remarks column
  
  ###### there will likely be additional columns added like parent_material_number possibly more
  
  #iterate to next row entry
  
#}



codes <- c()
designation_1 <- as.vector(grep("(-\\d{3}-\\d{2})",data_vec, value = FALSE))
designation_2 <- as.vector(grep("(-\\d{3}-.._.)",data_vec, value = FALSE))

designation <-sort(c(designation_1, designation_2))
#designation_3 <- sort(designation_3)


for(i in designation){
  if(i %in% designation_2 == TRUE){
    codes <-c(codes, data_vec[i])
  } else {
    codes <- c(codes,paste(data_vec[i],data_vec[i+1]))}
}

data_vec <- sub("(--)$",'-',data_vec)
codes
designation_2
data_vec[25]
designation
