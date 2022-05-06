install.packages("haven") # import SPSS data
install.packages("dplyr") # data management
install.packages("tidyr")
install.packages("ggplot2") # produce different types of plots
install.packages("cluster") # cluster analysis
install.packages("factoextra") # visualizes output of cluster analysis
install.packages("car") # for assessing significance of cluster differences (ANOVA)
install.packages("lubridate")
install.packages("reshape2")
install.packages("TSstudio")
install.packages("tidyverse")

library(tidyr)
library(haven)
library(dplyr)
library(ggplot2)
library(cluster)
library(factoextra)
library(car)
library(lubridate)
library(reshape2)
library(TSstudio)
library(tidyverse)

###################################
### Download data from the web ####
###################################

download_data <- function(url, filename){
    download.file(url = url, destfile = paste0(filename, ".csv"))
}

url_listings <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-12-05/data/listings.csv.gz"
url_calendar <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-12-05/data/calendar.csv.gz"

dir.create("../../data/")
download_data(url_listings, "../../data/listings")
download_data(url_calendar, "../../data/calendar")