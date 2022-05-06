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

##########################################
#See an example plot of one neighbourhood#
##########################################

#import data
Average_Daily_price_per_neighbourhoods <- read.csv("../../gen/temp/aggregated_df.csv.gz")

Average_Daily_price_per_neighbourhoods$date <- as.Date(Average_Daily_price_per_neighbourhoods$date)
Date <- Average_Daily_price_per_neighbourhoods$date

pdf("../../gen/output/plot_one.pdf")
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
dev.off()