library(dplyr)
library(reshape2)

###################################
### Download data from the web ####
###################################

download_data <- function(url, filename){
    download.file(url = url, destfile = paste0(filename, ".csv"))
}

url_listings <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-12-05/data/listings.csv.gz"
url_calendar <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-12-05/data/calendar.csv.gz"


download_data(url_listings, "../../data/listings")
download_data(url_calendar, "../../data/calendar")