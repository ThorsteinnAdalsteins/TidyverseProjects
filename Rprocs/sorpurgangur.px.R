require(pxweb)

# PXWEB query 
pxweb_query_list <- 
  list("Ráðstöfun úrgangs"=c("0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"),
       "Ár"=c("0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"))

# Download data 
px_data <- 
  pxweb_get(url = "http://px.hagstofa.is/pxis/api/v1/is/Umhverfi/urgangur/UMH04102.px",
            query = pxweb_query_list)

# Convert to data.frame 
px_data.df <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")

# Get pxweb data comments 
px_data_comments <- pxweb_data_comments(px_data)
px_data_comments_df <- as.data.frame(px_data_comments)

# Cite the data as 
pxweb_cite(px_data)

head(px_data.df)
str(px_data.df)
