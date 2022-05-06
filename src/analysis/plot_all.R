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

#####################################
#See the plot for all neighbourhoods#
#####################################

#Import data
Average_Daily_price_per_neighbourhoods <- read.csv("../../gen/temp/aggregated_df.csv.gz")

Average_Daily_price_per_neighbourhoods$date <- as.Date(Average_Daily_price_per_neighbourhoods$date)
Date <- Average_Daily_price_per_neighbourhoods$date

pdf("../../gen/output/plot_all.pdf")

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

dev.off()