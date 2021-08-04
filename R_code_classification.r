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
