v120schem<-pdf_text(paste0(getwd(),"/v120schematic.pdf"))

schemClean <- v120schem[200] %>%
  strsplit(., split=" ")

v120schem[1]

p <- lapply(v120schem[200], function(z){z[z!=""]})

strsplit(x=p, split=" ")

str_extract_all(p,"(\\d|\\w|\\.|\\-|\\+|\\,])+")

