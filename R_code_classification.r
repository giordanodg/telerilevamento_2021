library(raster)
setwd("/Users/Giordano/lab/")

#andiamo a scaricare il dato, che è un immagine in virtuale

solar<-brick("Solar_Orbiter_s_first_view_of_the_Sun.png")

#per visualizzare i livelli RGB

plotRGB (solar, 1, 2, 3, stretch="lin")
