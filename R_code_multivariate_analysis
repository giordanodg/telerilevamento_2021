# R_code_multivariate_analysis.r

library(raster) 
library(RStoolbox)

setwd("/Users/Giordano/lab/")

p224r63_2011 <- brick("p224r63_2011_masked.grd") 

plot(p224r63_2011)

#plottiamo la nostra banda uno contro i valori della banda due e le leghiamo con il dollaro,
#imposto il colore, pch sono i simboli e imposto il pallino che corrisponde al 19 e aumento la dimensione 
#con la funzione cex

plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)

#avremmo un diagramma x,y con punti rossi
#utilizzando la funzione pairs function,
#ci correla le bande e ci indica quale banda si correla in maniera migliore

pairs(p224r63_2011)

#per diminuire la risoluzione aggregriamo i pixel con la funzione aggregrate

p224r63_2011res <- aggregate(p224r63_2011, fact=10)

#per vederlo, facciamo un pannello con 2 immagini dentro

par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin") 
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")

#NB, utilizzare sempre il trattino basso

p224r63_2011res_pca <- rasterPCA(p224r63_2011res) 
summary(p224r63_2011res_pca$model)

#se scriviamo solo il nome vediamo le informazioni e le funzioni che abbiamo utilizzato 
#con l'immagine

p224r63_2011res_pca

#dev.off

plotRGB(p224r63_2011res_pca$map, r=1, g=2, b=3, stretch="lin")
