#build_dataframe <- function(cleaned_data){
  #### This takes cleaned data from item_parse() and builds a dataframe row by row as well as capturing metadata
library(tidyverse)  
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

split_index <- match("Pos",(cleaned_data))

metadata_vec <- cleaned_data[1:split_index-1]


  #record position for Pos as 'split_here'
  
  #take data at 'split_here' -1 and assign as a list called 'metadata'
    #metadata:
      #turbine: concatanate first several entries: 'v116/120 2.2 Mw Mk 11D'
      #doc_description: concatanate next entries: 'Hub Illustrated Part Catalogue Document Number:'
      #doc_number: 0000-0000 or 000000 format.
      #version_description: 'Version 00. Class: restricted, Type:T09, Date: some_date'
      #current_page: as.number( 49) skip "of"
      #last_page: as.number(126)
      ###### More metadata will need to be added for linking pages, parent material numbers and other things as needed
      ###### this metadata might be best as a totally separate list or dataframe that is linked to the entries below.
  
  #look for the first occurance of 3 digit number after split_here. add them to column Pos
  #change to as.Number()
  
  #look for next entry. Should be a 3 digit number at max. add to Qty column as.Number()
  
  #look for next entry. Should be a 6-10 digit number. add to Material column as.Number()
  
  #look for next entries. should be a series of strings. add to Description column as.List()
  
  #look for next two entries. First should start with '-' concat the two together. add to Codes column
  
  #look for next entries that are not a 1-3 digit number add to Remarks column
  
  ###### there will likely be additional columns added like parent_material_number possibly more
  
  #iterate to next row entry
  
#}

