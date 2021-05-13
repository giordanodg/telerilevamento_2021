# Time series analisys
# Greenland increase of temperature
# Data and notes from Giordano Di Giacinto

library(raster)

setwd("/Users/Giordano/lab/greenland") 

lst_2000 <- raster("lst_2000.tif")

lst_2005 <- raster("lst_2005.tif")

lst_2010 <- raster("lst_2010.tif")

lst_2015 <- raster("lst_2015.tif")

par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)
 
list.files()
rlist <- list.files(pattern="lst")
rlist


import <- lapply(rlist,raster)
import

TGr <- stack(import)
plot(TGr)
plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")

