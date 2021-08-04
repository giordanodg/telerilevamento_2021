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
 


