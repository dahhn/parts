make_parts_dataframe <- function(pdf_list, table_of_contents){
  parts_dataframe <- tibble(pos = character(),
                            qty = numeric(),
                            material_no = numeric(),
                            description = character(),
                            codes = character(),
                            section_no = character(),
                            parent = character(),
                            parent_ipv = character(),
                            turbine = character(),
                            common_name = character(),
                            pages = numeric()
                            )
  start <- page_finder(table_of_contents_0083_9277,"How the IPC is Organised") + 1
  toc <- table_of_contents_0083_9277 %>% filter(page >= start) %>% mutate(pg_range = page)

shift <- function(x, n){
  c(x[-(seq(n))], rep(NA, n)) - 1
}

toc$pg_range <- shift(toc$pg_range,1)

toc$pg_range <- ifelse(
  is.na(toc$pg_range) == TRUE, toc$page,
  ifelse(toc$page < toc$pg_range, paste0(toc$page, ":", toc$pg_range), toc$pg_range))
}


##########################################################
apply
