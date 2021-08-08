#R code complete - Telerilevamento Geo-Ecologico

#-----------------------------------------------

#Summary

# 1. Remote sensing first code
# 2. R code time series
# 3. R code Copernicus
# 4. R code knitr
# 5. R code Analisi Multivariata
# 6. R code classification
# 7. R code Indici di vegetazione
# 8. R code Land Cover
# 9. R code Variabilità
# 10. R code ggplot2 

#------------------------------------------------

# 1. Remote sensing first code

# My frst code in R for remote sensing!!!
# Il mio primo codice in R per il telerilevamento!
# install.packages("raster")

library(raster)


setwd("/Users/Giordano/Desktop/lab/")
p224r63_2011 <- brick("p224r63_2011_masked.grd") p224r63_2011

plot(p224r63_2011)

# colour change
cl <- colorRampPalette(c("black","grey","light grey")) (100) plot(p224r63_2011, col=cl)

# colour change -> new
cl <- colorRampPalette(c("blue","green","grey","red","magenta","yellow")) (100) plot(p224r63_2011, col=cl)

cls <- colorRampPalette(c("red","pink","orange","purple")) (200) plot(p224r63_2011, col=cls)

# dev.off resetta la schermata per plottare

dev.off()
plot(p224r63_2011$B1_sre)

cls <- colorRampPalette(c("red","pink","orange","purple")) (200) plot(p224r63_2011$B1_sre, col=cls)

# dev.off()
plot(p224r63_2011$B1_sre)

plot(p224r63_2011$B2_sre)

# 1 row, 2 columns
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 2 row, 1 columns
par(mfrow=c(2,1)) 

# se vogliamo indicare invece prime le colonne : par(mfcol....) 

plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# plot le prime 4 bande 

par(mfrow=c(4,1))

plot(p224r63_2011$B1_sre) 
plot(p224r63_2011$B2_sre) 
plot(p224r63_2011$B3_sre) 
plot(p224r63_2011$B4_sre)

# plottiamo ora un quadrato di bande:

par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre) 
plot(p224r63_2011$B2_sre) 
plot(p224r63_2011$B3_sre) 
plot(p224r63_2011$B4_sre)

# ora utilizzando color ramppalette impostiamo i colori :

par(mfrow=c(2,2))

clb <- colorRampPalette(c("dark blue","blue","light blue")) (100)
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c("dark green","green","light green")) (100)
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c("dark red","red","pink")) (100)
plot(p224r63_2011$B3_sre, col=clr)

clnir <- colorRampPalette(c("red","orange","yellow")) (100) 
plot(p224r63_2011$B4_sre, col=clnir)

# RGB plotting

# Bande Landsat

# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin") 
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") 
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin") 
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# Exercise: mount a 2x2 multiframe

par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin") 
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") 
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin") 
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin") 
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")


#-----------------------------------------------


# 2. R code time series

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
 

#------------------------------------------------

# 3. R code Copernicus

#installo il pacchetto per la lettura dei file nc

install.packages("ncdf4")

#richiamo la funzione raster e la funzione del pacchetto appena installato

library(raster)
library(ncdf4)

#indico la cartella dove si trova il file da rasterizzare

setwd("/Users/Giordano/lab/") #mac

#nomino il file rasterizzato "albedo"

albedo <- raster("c_gls_ALBH_202006130000_GLOBE_PROBAV_V1.5.1.nc")

#scelgo la palette di colori per rappresentare l'albedo del nostro file raster

cl <- colorRampPalette(c('light blue','green','red','yellow'))(100)

#plotto 

plot(albedo, col=cl)

#se ho un file troppo pesante, posso diminuire la grandezza del file ricampionando i pixel,raggruppandoli
#con la funzione "fact=x"

Albedoresampling<-albedo, fact=10


#----------------------------------------------------------

# 4. R code Knitr

#R_code_knitr.r

setwd("/Users/Giordano/lab")
install.packages("Knitr")
Library(knitr)

#----------------------------------------------------------

# 5. R code Classification

library(raster)
setwd("/Users/Giordano/lab/")

#andiamo a scaricare il dato, che è un immagine in virtuale

solar<-brick("Solar_Orbiter_s_first_view_of_the_Sun.png")

#per visualizzare i livelli RGB

plotRGB (solar, 1, 2, 3, stretch="lin")

#installiamo il pacchetto della funzione RStoolbox

install.packages("RStoolbox")
library(RStoolbox)

#la funzione che andremo ad utilizzare all'interno del RStoolbox si chiama "unsuperClass"

solarc<-unsuperClass(solar, nCLasses=3)

#plottiamo, allegando il nostro file attraverso il simbolo del dollaro a map

plot(solarc$map)

#scelgo il numero di classi con la funzione set.seed, per esempio in questo caso 42

set.seed(42)

#esercitazione, classificazione della stessa immagine ma in 20 classi, non più 3

solarc20<-unsuperClass(solar, nClasses=20)

plot(solarc20$map)

# scarico un immagine dal sito dell'ESA
# https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images

sun<-brick("sun.png")

# Unsupervised classification
sunc <- unsuperClass(sun, nClasses=3)
plot(sunc$map)

#rimprendo il mio codice, per classificare l'immagine sul grand Canyon
#richiamo le funzioni e setto la mia working directory

library(raster)
library(RStoolbox)

setwd("/Users/Giordano/lab")

gc<-brick("iss022e014078_087_lrg.jpg")

#imposto il filtro RGB, e imposto lo stretching in maniera tale che sia hist

plotRGB(gc, r=1, g=2, b=3, stretch="list")
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

#creo un modello di classsificazione del grand canyon, dobbiamo legare il modello alla mappa, quindi utiliziamo il simbolo del $

gcc2<-unsuperClass(gc, nClasses=2)
gcc2
plot<-(gcc2$map)

#modello con 4 classi 

gcc4<-unsuperClass(gc,nClasses=4)
gcc4
plot(gcc4$map)

#----------------------------------------------

# 6. R code analisi multivariata 

library(raster)
setwd("/Users/Giordano/lab/")

#andiamo a scaricare il dato, che è un immagine in virtuale

solar<-brick("Solar_Orbiter_s_first_view_of_the_Sun.png")

#per visualizzare i livelli RGB

plotRGB (solar, 1, 2, 3, stretch="lin")

#installiamo il pacchetto della funzione RStoolbox

install.packages("RStoolbox")
library(RStoolbox)

#la funzione che andremo ad utilizzare all'interno del RStoolbox si chiama "unsuperClass"

solarc<-unsuperClass(solar, nCLasses=3)

#plottiamo, allegando il nostro file attraverso il simbolo del dollaro a map

plot(solarc$map)

#scelgo il numero di classi con la funzione set.seed, per esempio in questo caso 42

set.seed(42)

#esercitazione, classificazione della stessa immagine ma in 20 classi, non più 3

solarc20<-unsuperClass(solar, nClasses=20)

plot(solarc20$map)

# scarico un immagine dal sito dell'ESA
# https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images

sun<-brick("sun.png")

# Unsupervised classification
sunc <- unsuperClass(sun, nClasses=3)
plot(sunc$map)

#rimprendo il mio codice, per classificare l'immagine sul grand Canyon
#richiamo le funzioni e setto la mia working directory

library(raster)
library(RStoolbox)

setwd("/Users/Giordano/lab")

gc<-brick("iss022e014078_087_lrg.jpg")

#imposto il filtro RGB, e imposto lo stretching in maniera tale che sia hist

plotRGB(gc, r=1, g=2, b=3, stretch="list")
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

#creo un modello di classsificazione del grand canyon, dobbiamo legare il modello alla mappa, quindi utiliziamo il simbolo del $

gcc2<-unsuperClass(gc, nClasses=2)
gcc2
plot<-(gcc2$map)

#modello con 4 classi 

gcc4<-unsuperClass(gc,nClasses=4)
gcc4
plot(gcc4$map)

#---------------------------------------------------

# 7. R code inidici di vegetazione

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

#----------------------------------------------

# 8. R code land cover

#installiamo ggplot 

install.packages("ggplot2")

#installiamo gridExtra

install.packages("gridExtra")

#installiamo rasterVid

install.packages("rasterVid")

#richiamo le funzioni

library(rasterVid)
library(RStoolbox) 


setwd("/Users/Giordano/lab/")

# plot RGB

defor1 <- brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
ggRGB(defor1, r=1, g=2, b=3, stretch="lin")

defor2 <- brick("defor2.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#multiframe with ggplot2 and gridExtra
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p2, nrow=2)

#unsupervised classification
d1c <- unsuperClass(defor1, nClasses=2)
plot(d1c$map)
# class 1: forest
# class 2: agriculture

# set.seed() would allow you to attain the same results ...

d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)
# class 1: agriculture
# class 2: forest

d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map)

# frequencies
freq(d1c$map)
#   value  count
# [1,]     1 306583
# [2,]     2  34709

s1 <- 306583 + 34709

prop1 <- freq(d1c$map) / s1
# prop forest: 0.8983012
# prop agriculture: 0.1016988

s2 <- 342726
prop2 <- freq(d2c$map) / s2
# prop forest: 0.5206958
# prop agriculture: 0.4793042

# build a dataframe
cover <- c("Forest","Agriculture")
percent_1992 <- c(89.83, 10.16)
percent_2006 <- c(52.06, 47.93)

percentages <- data.frame(cover, percent_1992, percent_2006)
percentages

#plottiamo

ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

grid.arrange(p1, p2, nrow=1)


#---------------------------------------------

# 9. R code Variabilità

#installiamo ggplot 

install.packages("ggplot2")

#installiamo gridExtra

install.packages("gridExtra")

#installiamo rasterVid

install.packages("rasterVid")

#richiamo le funzioni

library(rasterVid)
library(RStoolbox) 


setwd("/Users/Giordano/lab/")

# plot RGB

defor1 <- brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
ggRGB(defor1, r=1, g=2, b=3, stretch="lin")

defor2 <- brick("defor2.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#multiframe with ggplot2 and gridExtra
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p2, nrow=2)

#unsupervised classification
d1c <- unsuperClass(defor1, nClasses=2)
plot(d1c$map)
# class 1: forest
# class 2: agriculture

# set.seed() would allow you to attain the same results ...

d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)
# class 1: agriculture
# class 2: forest

d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map)

# frequencies
freq(d1c$map)
#   value  count
# [1,]     1 306583
# [2,]     2  34709

s1 <- 306583 + 34709

prop1 <- freq(d1c$map) / s1
# prop forest: 0.8983012
# prop agriculture: 0.1016988

s2 <- 342726
prop2 <- freq(d2c$map) / s2
# prop forest: 0.5206958
# prop agriculture: 0.4793042

# build a dataframe
cover <- c("Forest","Agriculture")
percent_1992 <- c(89.83, 10.16)
percent_2006 <- c(52.06, 47.93)

percentages <- data.frame(cover, percent_1992, percent_2006)
percentages

#plottiamo

ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

grid.arrange(p1, p2, nrow=1)


#------------------------------------------------------

# 10. R code ggplot2

library(raster)
library(RStoolbox)
library(ggplot2)
library(gridExtra)

setwd("~/lab/")

p224r63 <- brick("p224r63_2011_masked.grd")

ggRGB(p224r63,3,2,1, stretch="lin")
ggRGB(p224r63,4,3,2, stretch="lin")

p1 <- ggRGB(p224r63,3,2,1, stretch="lin")
p2 <- ggRGB(p224r63,4,3,2, stretch="lin")

grid.arrange(p1, p2, nrow = 2) # this needs gridExtra






 
