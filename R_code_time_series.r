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

#installiamo e inseriamo il pacchetto library(rasterVis)

install.packages("rasterVis")
library(rasterVis)
setwd("/Users/Giordano/lab/greenland")
    
rlist <- list.files(pattern="lst")
rlist

import <- lapply(rlist,raster)
import

TGr <- stack(import)
TGr


levelplot(TGr,col.regions=cl, main="LST variation in time",names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

#melt

meltlist <- list.files(pattern="melt")
melt_import <- lapply(meltlist,raster)
melt <- stack(melt_import)
melt
 

melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt

#il dollaro si utilizza per legare i file
#creo una colorramppalette
    
clb <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount, col=clb)

levelplot(melt_amount, col.regions=clb)
 

