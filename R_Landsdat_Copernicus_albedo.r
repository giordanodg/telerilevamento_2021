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


##
 
