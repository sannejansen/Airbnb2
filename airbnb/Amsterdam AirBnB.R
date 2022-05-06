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

###############################
#Average price per day overall#
###############################

Average_Daily_price_all_neighbourhoods <- Neighbourhoods_price_date %>%
    group_by(date) %>%
    summarise_at(vars(price), list(price = mean), na.rm = TRUE)
#################################################
#Price per day for every neighourhood seperately#
#################################################
Neighbourhoods_price_date_no_id <- select(Neighbourhoods_price_date, -id)

Neighbourhoods_price_date_no_id <- Neighbourhoods_price_date_no_id %>%
    group_by(date, neighbourhood_cleansed) %>%
    summarize(price_mean = mean(price, na.rm = TRUE))

Average_Daily_price_per_neighbourhoods <- Neighbourhoods_price_date_no_id %>%
    pivot_wider(names_from = neighbourhood_cleansed, values_from = price_mean) 

View(Average_Daily_price_per_neighbourhoods)
Average_Daily_price_per_neighbourhoods <- Average_Daily_price_per_neighbourhoods[-c(367),]
#Make a new .csv file for the All_Neighbourhoods dataset
write.csv(Average_Daily_price_per_neighbourhoods, "Average_Daily_Prices_Per_Neighbourhood.csv.gz")

##########################################
#See an example plot of one neighbourhood#
##########################################

Average_Daily_price_per_neighbourhoods$date <- as.Date(Average_Daily_price_per_neighbourhoods$date)
Date <- Average_Daily_price_per_neighbourhoods$date

plot(Date,
     Average_Daily_price_per_neighbourhoods$`Bijlmer-Centrum`,
     main = "Bijlmer Centrum example",
     xlab = "Date",
     ylab = "Price",
     type = "l",
     col = "pink", 
     lwd = "2",
     xaxt = "n")
axis(1,
     Average_Daily_price_per_neighbourhoods$date,
     format(Average_Daily_price_per_neighbourhoods$date, "%m"))

#See the data in a scatterplot here:
scatter.smooth(Date,
               Average_Daily_price_per_neighbourhoods$`Bijlmer-Centrum`,
               main = "Bijlmer Centrum example",
               xlab = "Date",
               ylab = "Price",
               col = "pink", 
               lwd = "2",
               xaxt = "n")
axis(1,
     Average_Daily_price_per_neighbourhoods$date,
     format(Average_Daily_price_per_neighbourhoods$date, "%m"))
#####################################
#See the plot for all neighbourhoods#
#####################################

plot(Date,
     Average_Daily_price_per_neighbourhoods$`Bijlmer-Centrum`,
     type = "l",
     col = "1", 
     lwd = "2",
     ylim = c(100,247))
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`Bijlmer-Oost`, 
      type = "l",
      lwd = "2",
      col = "2")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`Bos en Lommer`, 
      type = "l",
      lwd = "2",
      col = "3")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`Buitenveldert - Zuidas`, 
      type = "l",
      lwd = "2",
      col = "4")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`Centrum-Oost`, 
      type = "l",
      lwd = "2",
      col = "11")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`Centrum-West`, 
      type = "l",
      lwd = "2",
      col = "6")                   
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`De Aker - Nieuw Sloten`, 
      type = "l",
      lwd = "2",
      col = "7")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`De Baarsjes - Oud-West`, 
      type = "l",
      lwd = "2",
      col = "8")                              
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`De Pijp - Rivierenbuurt`, 
      type = "l",
      lwd = "2",
      col = "pink")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`Gaasperdam - Driemond`, 
      type = "l",
      lwd = "2",
      col = "10")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`Geuzenveld - Slotermeer`, 
      type = "l",
      lwd = "2",
      col = "5")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`IJburg - Zeeburgereiland`, 
      type = "l",
      lwd = "2",
      col = "12")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`Noord-Oost`, 
      type = "l",
      lwd = "2",
      col = "violetred3")                   
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`Noord-West`, 
      type = "l",
      lwd = "2",
      col = "14")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`Oostelijk Havengebied - Indische Buurt`, 
      type = "l",
      lwd = "2",
      col = "lemonchiffon3")                                            
lines(Date, 
      Average_Daily_price_per_neighbourhoods$Osdorp, 
      type = "l",
      lwd = "2",
      col = "16")                   
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`Oud-Noord`, 
      type = "l",
      lwd = "2",
      col = "17")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$`Oud-Oost`, 
      type = "l",
      lwd = "2",
      col = "18")                              
lines(Date, 
      Average_Daily_price_per_neighbourhoods$Slotervaart, 
      type = "l",
      lwd = "2",
      col = "19")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$Watergraafsmeer, 
      type = "l",
      lwd = "2",
      col = "20")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$Westerpark, 
      type = "l",
      lwd = "2",
      col = "21")
lines(Date, 
      Average_Daily_price_per_neighbourhoods$Zuid,
      type = "l",
      lwd = "2",
      col = "violetred3")
legend(x = "topright",
       legend = c("BC", "BO", "BL","BZ", "CO", "CW","DANS", "BOW", "DPRB","GD", "GS", "IZ", "NO", "NW", "OHIB", "OD", "ON", "OO", "SV", "WGM", "WP", "ZUID"),
       lty = c(1,1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ,1, 1 ,1 ,1 , 1, 1, 1),
       col = c(1, 2, 3, 4, 11, 6, 7, 8, 'pink', 10, 5, 12, 'violetred3', 14, 'lemonchiffon3', 16, 17, 18, 19, 20, 21, 22),
       lwd = 2)

##########################################
#Remove the date column in  the datasets##
##########################################
See_All_neighbourhoods_without_date <- Average_Daily_price_per_neighbourhoods[,2:23]
View(See_All_neighbourhoods_without_date)


summary(See_All_neighbourhoods_without_date)
#########################
#Average prices per day##
#########################

#Add a row with the average price per day regarding all neighbourhoods
See_All_neighbourhoods_without_date$Daily_price_means <- rowMeans(See_All_neighbourhoods_without_date)

View(See_All_neighbourhoods_without_date)

######################################################
#See what the average price changes are over one year#
######################################################


#Select only the first seven and last seven, to compare to each other
See_All_neighbourhoods_without_date_First_seven <- head(See_All_neighbourhoods_without_date, 7)
View(See_All_neighbourhoods_without_date_First_seven)

See_All_neighbourhoods_without_date_Last_seven <- tail(See_All_neighbourhoods_without_date, 7)
View(See_All_neighbourhoods_without_date_Last_seven)

colMeans(See_All_neighbourhoods_without_date_First_seven)
colMeans_See_All_neighbourhoods_without_date_First_seven <-  colMeans(See_All_neighbourhoods_without_date_First_seven)
View(colMeans_See_All_neighbourhoods_without_date_First_seven)

colMeans(See_All_neighbourhoods_without_date_Last_seven)
colMeans_See_All_neighbourhoods_without_date_Last_seven <-  colMeans(See_All_neighbourhoods_without_date_Last_seven)
View(colMeans_See_All_neighbourhoods_without_date_Last_seven)

Difference_colMeans <- print(colMeans_See_All_neighbourhoods_without_date_First_seven- colMeans_See_All_neighbourhoods_without_date_Last_seven )

Price_Change <- print(Difference_colMeans/colMeans_See_All_neighbourhoods_without_date_First_seven)

Price_Change_100 <- print(Price_Change * 100)

############################################################################################################
#conduct a linear regression to examine the relationship between price as dv and review_scores_rating as iv#
############################################################################################################
listings_lm1 <- lm(price~review_scores_rating, AirBNB_AMS_listings);
summary(listings_lm1)
        
#create a table with the average review score per neighborhood
listings <- AirBNB_AMS_listings %>%
    select(neighbourhood_cleansed, price, review_scores_rating)


Table_reviewscore <-  (listings%>%
                           group_by(neighbourhood_cleansed) %>%
                           na.omit(listings) %>%
                           summarise_at(vars(review_scores_rating), list(review_scores_rating = mean)))
        
print(Table_reviewscore, n=Inf, na.rm=TRUE)
########################################
#plot to see whether there is normality#
########################################
ggplot(AirBNB_AMS_listings, aes(review_scores_rating))+ geom_histogram(bins=50)
        
AirBNB_AMS_listings_sample <- sample_n(AirBNB_AMS_listings, 5000)

#Check for normality
shapiro.test(AirBNB_AMS_listings_sample$price)  
shapiro.test(AirBNB_AMS_listings_sample$review_scores_rating)

########################################
#plot to see whether there is linearity#
########################################
ggplot(AirBNB_AMS_listings, aes(x=review_scores_rating, y=price)) + geom_point()
 
####################################       
#plot to check for homoskedasticity#
####################################
review_hmsc <- AirBNB_AMS_listings$price
ggplot(AirBNB_AMS_listings, aes(x=review_scores_rating, y=review_hmsc))+ geom_point()


leveneTest(price ~ neighbourhood, AirBNB_AMS_listings_sample)



        
