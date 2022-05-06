library(dplyr)
library(reshape2)

##########################################
#See an example plot of one neighbourhood#
##########################################

#import data
Average_Daily_price_per_neighbourhoods <- read.csv("../../gen/temp/Average_Daily_Prices_Per_Neighbourhood.csv.gz")

Average_Daily_price_per_neighbourhoods$date <- as.Date(Average_Daily_price_per_neighbourhoods$date)
Date <- Average_Daily_price_per_neighbourhoods$date

pdf("../../gen/output/Average_Daily_price_per_neighbourhoods.pdf")
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