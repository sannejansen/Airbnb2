
#########################
### Clean the dataset ###
#########################

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