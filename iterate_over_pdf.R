#get all the pages
v120hub<-pdf_text(paste0(getwd(),"/V120hub.pdf"))
scrub(v120hub)




## toc = Table of Contents
make_toc_dataframe <- function(pdf_list){

index_grep <- function(regex, my_list){
    grepl(regex, my_list)%>%
    which()%>%
    as.numeric()
} 

#look for which page has "Table of Contents"
  toc_start_page <- index_grep("Table of Contents",doc_0083_9277)%>%paste0("p",.)
  first_pg <- doc_0083_9277[toc_start_page] %>% unlist()
#if found, then search through the document to find the start of parts  
  toc_intro_ <- first_pg%>%index_grep("Introduction",.)
  #modules_start<- first_pg%>%index_grep("How the IPC is Organised",.)+1

x <- first_pg%>%str_trim()%>%str_split('`') #split vectors at backtics

y<-x[toc_intro_:length(x)]#removes extra entries at the beginning

#declare empty dataframe for table of contentse
toc_df <- tibble(section= character(),
                 description= character(),
                 module_number= character(),
                 page=character()) 

#will switch to apply type function later
for(i in y ){
  toc_df <- rbind(i,toc_df)
}

}



######### BELOW THIS IS UNTESTED ###########
#############################################

#function: build metadata table
mk_version <- clean %>%
  #pattern to match for turbine model, size, and mk version
  str_extract('(\\D{1}\\d{3}/\\D{1}\\d{3} \\d\\.\\d \\D{2} \\D{2} \\d{2}\\D)')%>%
  set_names("turbine")

page_num =0
#document_no
doc_num <-clean %>%
  str_extract("(Document number: \\d{4}.\\d{4})")%>%
  str_extract('(\\d{4}.\\d{4})')%>%
  str_replace('\\-', "_")


current_page <- page_nums[1]
last_page <- page_nums[2]
split_page <-g %>%
  str_extract("(How the IPC is Organised ..)")%>%
  str_extract("\\d")%>%
  as.numeric()
split_index <- grep("(How the IPC is Organised ..)",g[[1]],value=FALSE)
start_index <- split_index+1
intro_index <- grep("Introduction",g[[1]],value=FALSE)
toc <- tibble() %>%
  add_column(section=NA,description=NA,part_num=NA,page=NA)


#####
document_name <- paste0("doc.",doc_num,)

assign()

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
clean[2]
