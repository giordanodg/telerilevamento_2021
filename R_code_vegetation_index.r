library(raster)
setwd("/Users/Giordano/lab)

#carichiamo le immagini con la funzione brick

defor1<-brick("defor1.jpg")
defor2<-brick("defor2.jpg")

#plottiamo le immagini con un plot RGB

plottRGB(defor1, r=1, g=2, b=3, stretch="lin")
plottRGB(defor2, r=1, g=2, b=3, stretch="lin")

#calcoliamo un indice di vegetazione prima e uno dopo, quindi sottraiamo
#NDVI

#time 1

dvi1 <- defor1$defor1.1 - defor1$defor1.2
plot(dvi1)

#cambiamo i colori con ColorRampalette

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

plot(dvi1, col=cl, main="DVI at time 1")

#time 2

dvi2 <- defor2$defor2.1 - defor2$defor2.2 
plot(dvi2, col=cl, main="DVI at time 2") 
par(mfrow=c(2,1))

plot(dvi1, col=cl, main="DVI at time 1") 
plot(dvi2, col=cl, main="DVI at time 2")

#come osserviamo la differenza tra i 2 NDVI?
difdvi <- dvi1 - dvi2

cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cld)

# (NIR-RED) / (NIR+RED)
ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2) 
plot(ndvi1, col=cl)


#proviamo un altro indice all'interno del pacchetto di RStoolbox
#spectralIndices

vi<-spectrialIndices(defor1, green = 3, red = 2, nir = 1)

plot(vi1, col=cl)

#uso la funzione cividis


