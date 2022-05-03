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

################################
#Download the data from the web#
################################
download_data <- function(url, filename){
    download.file(url = url, destfile = paste0(filename, ".csv"))
}

url_listings <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-12-05/data/listings.csv.gz"
url_calendar <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-12-05/data/calendar.csv.gz"


download_data(url_listings, "listings")
download_data(url_calendar, "calendar")


AirBNB_AMS_calendar <- read.csv("calendar.csv")
AirBNB_AMS_listings <- read.csv("listings.csv")

######
#data#
######
#Filter out the dollar sign before the prices
AirBNB_AMS_listings$price = as.numeric(gsub("\\$", "", AirBNB_AMS_listings$price))

#Filter out the NA and then calculate the mean price of the whole dataset
mean(AirBNB_AMS_listings$price, na.rm=TRUE)

#Filter out the NA for all columns
AirBNB_AMS_listings%>%
    filter(na.rm = TRUE)

na.omit(AirBNB_AMS_listings)

#See how many AirBNBs are rented per neighbourhood (the count)
AirBNB_AMS_listings %>%
    count(neighbourhood_cleansed)


#New dataset containing only the price and the neighbourhoods
AirBNB_AMS_listings_new <-  subset(AirBNB_AMS_listings, select = c ("neighbourhood_cleansed", "price")) %>%
    filter(na.rm = TRUE)

View(AirBNB_AMS_listings_new)

#Table with average price per neighbourhood
Table_Average_price <-  (AirBNB_AMS_listings_new %>%
                           group_by(neighbourhood_cleansed) %>%
                           na.omit(AirBNB_AMS_listings_new) %>%
                           summarise_at(vars(price), list(price = mean)))

print(Table_Average_price, n=Inf, na.rm=TRUE)

#To merge, make the column with the listings the same name for both datasets:
AirBNB_AMS_calendar_renamed <- AirBNB_AMS_calendar %>%
    rename(
        id = listing_id
    )

#Put the neighbhourhood in the listings dataset
AirBNB_AMS_listings_with_id_and_neighbourhoods <- subset(AirBNB_AMS_listings, select = c(neighbourhood_cleansed, id))

AirBNB_Calendar_and_Listings <- merge(AirBNB_AMS_calendar_renamed, AirBNB_AMS_listings_with_id_and_neighbourhoods, by = "id", all.y = TRUE)


#Make a new dataset containing only the variables that are needed/the variables we want to look at: id, data, price, neighbourhood_cleansed
Neighbourhoods_price_date <- subset(AirBNB_Calendar_and_Listings, select = c(id, date, price, neighbourhood_cleansed))

#Filter out the dollar sign before the price in this new dataset
Neighbourhoods_price_date$price = as.numeric(gsub("\\$", "", Neighbourhoods_price_date$price,))

#Average price per day overall
Average_Daily_price_all_neighbourhoods <- Neighbourhoods_price_date %>%
    group_by(date) %>%
    summarise_at(vars(price), list(price = mean), na.rm = TRUE)

#Average price per day, per neighbourhood
Average_Daily_price_per_neighbourhood <- Neighbourhoods_price_date %>%
    group_by(date) %>%
    summarise_at(vars(price), list(price = mean), na.rm = TRUE)


View(Neighbourhoods_price_date)

Neighbourhoods_price_date_no_id <- select(Neighbourhoods_price_date, -id)
View(Neighbourhoods_price_date_no_id)

try4 <- Neighbourhoods_price_date_no_id %>%
    spread(neighbourhood_cleansed, price)

View(try4)

#Filter out the first neighbourhood: Bijlmer-Centrum (Price_1BC)
Bijlmer_Centrum_complete <- subset(Neighbourhoods_price_date, neighbourhood_cleansed %in% c("Bijlmer-Centrum"))
Bijlmer_Centrum <-   na.omit(Bijlmer_Centrum_complete)

View(Bijlmer_Centrum)

#Then, make an average price per day for the 1st neighbourhood
Daily_mean_BC_average <-  (Bijlmer_Centrum %>%
                               group_by(date) %>%
                               summarise_at(vars(price), list(price = mean), na.rm = TRUE))

Daily_mean_BC_average <-  Daily_mean_BC_average %>%
    rename(Price_1BC = price)




