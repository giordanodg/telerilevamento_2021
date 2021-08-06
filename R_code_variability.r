library(raster)
library(RStoolbox)
setwd("/Users/Giordano/lab")

sent<-brick("sentinel.png")

plotRGB(sent, stretch="lin")
nir<-sent$sentinel.1
red<-sent$sentinel.2

ndvi<-(nir-red)/(nir+red)
plot(ndvi)
cl<-colorRampPalette(c('black','white','red','magenta','green'))(100)
plot(ndiv, col=cl)

ndvisd3 <- focal(pc1, w=matrix (1/9,nrow=3,ncol=3), fun=sd)
plot(ndvisd3)

ndvimean3 <- focal(pc1, w=matrix (1/9,nrow=3,ncol=3), fun=sd)
clsd<-colorRampPalette(c('blue','green','magenta','orange','brown',))(100)
plot(ndvimean3,col=clsd)

ndvisd13 <- focal(ndvi, w=matrix(1/169, nrow=13, ncol=13),fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
plot(ndvisd13, col=clsd)

ndvisd13 <- focal(ndvi, w=matrix(1/169, nrow=13, ncol=13), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
plot(ndvisd13, col=clsd)

sentpca <- rasterPCA(sent) 
plot(sentpca$map)

summary(sentpca$model)
pc1 <- sentpca$map$PC1
pc1sd5 <- focal(pc1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 
plot(pc1sd5, col=clsd)

source("source_test_lezione.r")

source("source_ggplot.r")

#controlliamo se abbiamotutte le librerie

library(ggplot2)
library(gridExtra)
library(viridis)

install.packages("viridis")

#creiamo un nuovo blocco di ggplot
#decididamo la geometria
ggplot()+
geom_raster(pc




