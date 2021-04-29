#Examen parcial - Biogeografia Historica y Ecologica
#Colocar el directorio correspondiente 
setwd( )

#Leyendo datos
matriz=read.csv("Matriz.csv", header= TRUE)

#Cargamos los paquetes necesarios para el analisis
library(vegan)
library(gclus)
library(vegan)


### 1. Agrupamiento jerárquico aglomerado de los datos de especies
# Estandarizando los datos
matriz.norm = decostand(matriz, method = "normalize")

# Estimando matriz de distancias
matriz.ch = vegdist(matriz.norm, method = "bray")

# Agrupamiento de ward
matriz.ward = hclust(matriz.ch, method = "ward.D")

#Reordenamos la matriz
matriz.chwo = reorder.hclust(matriz.ward, matriz.ch)

#Graficamos el dendrograma con colores
plot(matriz.chwo, ylab = "Altura")
rect.hclust(matriz.chwo, k = 3, border = c("red","green3","blue"))

#Analisis de nMDS
matriz.nmds = metaMDS(matriz, distance = "bray", trymax = 20)

#nMDS con colores del analisis de agrupamiento
color = c("red","green3","blue")
matriz.chwo.g = cutree(matriz.chwo, k = 3)
plot(matriz.nmds, type = "n", display = "sites")
points(matriz.nmds, col = color[matriz.chwo.g], 
       bg = color[matriz.chwo.g], pch = 21, cex = 1.5)
legend("bottomleft", legend = paste("Grupos", 1:3),
       col = color, pt.bg = color, bty = "n", pch = 21, cex = 1.5)

