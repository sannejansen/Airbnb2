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

#import data
AirBNB_AMS_calendar <- read.csv("../../data/calendar.csv")
AirBNB_AMS_listings <- read.csv("../../data/listings.csv")


AirBNB_AMS_listings %>%
    count(neighbourhood_cleansed)

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

pdf("../../gen/output/normality.pdf")

ggplot(AirBNB_AMS_listings, aes(review_scores_rating))+ geom_histogram(bins=50)
        
AirBNB_AMS_listings_sample <- sample_n(AirBNB_AMS_listings, 5000)

#Check for normality
shapiro.test(AirBNB_AMS_listings_sample$price)  
shapiro.test(AirBNB_AMS_listings_sample$review_scores_rating)

########################################
#plot to see whether there is linearity#
########################################

pdf("../../gen/output/linearity.pdf")

ggplot(AirBNB_AMS_listings, aes(x=review_scores_rating, y=price)) + geom_point()
 
####################################       
#plot to check for homoskedasticity#
####################################
review_hmsc <- AirBNB_AMS_listings$price

pdf("../../gen/output/homoskedasticity.pdf")

ggplot(AirBNB_AMS_listings, aes(x=review_scores_rating, y=review_hmsc))+ geom_point()


leveneTest(price ~ neighbourhood, AirBNB_AMS_listings_sample)
