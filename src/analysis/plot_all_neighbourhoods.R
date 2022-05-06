library(dplyr)
library(reshape2)

#####################################
#See the plot for all neighbourhoods#
#####################################

#Import data
Average_Daily_Prices_Per_Neighbourhood_all <- read.csv("../../gen/temp/Average_Daily_Prices_Per_Neighbourhood.csv.gz")

pdf("../../gen/output/Average_Daily_price_per_neighbourhoods_all.pdf")
plot(Date,
     Average_Daily_price_per_neighbourhoods_all$`Bijlmer-Centrum`,
     type = "l",
     col = "1", 
     lwd = "2",
     ylim = c(100,247))
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`Bijlmer-Oost`, 
      type = "l",
      lwd = "2",
      col = "2")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`Bos en Lommer`, 
      type = "l",
      lwd = "2",
      col = "3")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`Buitenveldert - Zuidas`, 
      type = "l",
      lwd = "2",
      col = "4")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`Centrum-Oost`, 
      type = "l",
      lwd = "2",
      col = "11")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`Centrum-West`, 
      type = "l",
      lwd = "2",
      col = "6")                   
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`De Aker - Nieuw Sloten`, 
      type = "l",
      lwd = "2",
      col = "7")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`De Baarsjes - Oud-West`, 
      type = "l",
      lwd = "2",
      col = "8")                              
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`De Pijp - Rivierenbuurt`, 
      type = "l",
      lwd = "2",
      col = "pink")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`Gaasperdam - Driemond`, 
      type = "l",
      lwd = "2",
      col = "10")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`Geuzenveld - Slotermeer`, 
      type = "l",
      lwd = "2",
      col = "5")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`IJburg - Zeeburgereiland`, 
      type = "l",
      lwd = "2",
      col = "12")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`Noord-Oost`, 
      type = "l",
      lwd = "2",
      col = "violetred3")                   
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`Noord-West`, 
      type = "l",
      lwd = "2",
      col = "14")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`Oostelijk Havengebied - Indische Buurt`, 
      type = "l",
      lwd = "2",
      col = "lemonchiffon3")                                            
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$Osdorp, 
      type = "l",
      lwd = "2",
      col = "16")                   
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`Oud-Noord`, 
      type = "l",
      lwd = "2",
      col = "17")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$`Oud-Oost`, 
      type = "l",
      lwd = "2",
      col = "18")                              
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$Slotervaart, 
      type = "l",
      lwd = "2",
      col = "19")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$Watergraafsmeer, 
      type = "l",
      lwd = "2",
      col = "20")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$Westerpark, 
      type = "l",
      lwd = "2",
      col = "21")
lines(Date, 
      Average_Daily_price_per_neighbourhoods_all$Zuid,
      type = "l",
      lwd = "2",
      col = "violetred3")
legend(x = "topright",
       legend = c("BC", "BO", "BL","BZ", "CO", "CW","DANS", "BOW", "DPRB","GD", "GS", "IZ", "NO", "NW", "OHIB", "OD", "ON", "OO", "SV", "WGM", "WP", "ZUID"),
       lty = c(1,1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ,1, 1 ,1 ,1 , 1, 1, 1),
       col = c(1, 2, 3, 4, 11, 6, 7, 8, 'pink', 10, 5, 12, 'violetred3', 14, 'lemonchiffon3', 16, 17, 18, 19, 20, 21, 22),
       lwd = 2)
       