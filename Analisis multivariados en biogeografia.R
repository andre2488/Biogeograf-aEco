#Analisis multivariados en biogeografia I =======================
#Cargamos las bases de datos
spe = read.csv(file = "spe.csv", header = T)
spa = read.csv(file = "spa.csv", header = T)

# Remueve el sitio 8
spe = spe[-8, ]
spa = spa[-8, ]

# Mapa de los sitios de recolección ===============================

# Coordenadas geográficas x e y de spa, conectando 
#los puntos a traves del Río Doubs con una línea azul
plot(spa,
     type = "l", 
     main = "Localidades", 
     xlab = "Coordenadas x (km)", 
     ylab = "Coordenadas y (km)",
     col = "lightskyblue")

# Añadir las etiquetas de los las estaciones
text(spa, labels=row.names(spa), cex = 1, col = "black")
# Añadir texto 
text(68, 20, "Aguas arriba", cex = 1.2, col = "red")
text(15, 35, "Aguas abajo", cex = 1.2, col = "red")


# Mapas de especies de peces =======================================

# Graficar a 4 especies de peces
plot(spa,
     col = "brown", 
     cex = spe$Satr, 
     main = "Salmo trutta fario", 
     xlab = "Coordenadas x (km)", 
     ylab = "Coordenadas y (km)"
)
lines(spa, col = "lightskyblue")

plot(spa, 
     col = "brown", 
     cex = spe$Thth, 
     main = "Thymallus thymallus", 
     xlab = "Coordenadas x (km)", 
     ylab = "Coordenadas y (km)"
)
lines(spa, col = "lightskyblue")


plot(spa, 
     col = "brown", 
     cex = spe$Baba, 
     main = "Barbus barbus", 
     xlab = "Coordenadas x (km)", 
     ylab = "Coordenadas y (km)"
)
lines(spa, col = "lightskyblue")


plot(spa, 
     col = "brown", 
     cex = spe$Abbr, 
     main = "Abramis brama", 
     xlab = "Coordenadas x (km)", 
     ylab = "Coordenadas y (km)"
)
lines(spa, col = "lightskyblue")


# Agrupamiento Jerarquico ====================================
#Para esto debemos instalar previamente el paquete vegan, y luego
#lo cargaremos para poder usarlo.
library(vegan)
## Agrupamiento jerárquico aglomerado de los datos de especies

# Estandarizando los datos
spe.norm = decostand(spe, method = "normalize")

# Estimando matriz de distancias
spe.ch = vegdist(spe.norm, method = "bray")

# Comparando dendrogramas
par(mfrow = c(2, 2))

# Single linkage
spe.ch.single = hclust(spe.ch, method = "single")

plot(spe.ch.single, 
     labels = rownames(spe), 
     main = "Chord - Single linkage")

# Complete-linkage
spe.ch.complete = hclust(spe.ch, method = "complete")
plot(spe.ch.complete, 
     labels = rownames(spe), 
     main = "Chord - Complete linkage")

# UPGMA
spe.ch.UPGMA = hclust(spe.ch, method = "average")
plot(spe.ch.UPGMA, 
     labels = rownames(spe), 
     main = "Chord - UPGMA")


# Ward's minimum variance clustering
spe.ch.ward = hclust(spe.ch, method = "ward.D")
plot(spe.ch.ward, 
     labels = rownames(spe), 
     main = "Chord - Ward")
#Desconfiguramos la vista de multiples imagenes
dev.off()


# Seleccionar un número común de grupos
# Cortando los dendrogramas
spech.ward.g = cutree(spe.ch.ward, k = 4)
spech.ward.g

# Final con grupos seleccionados =====================

# Reordenar grupos
library(gclus)
spe.chwo = reorder.hclust(spe.ch.ward, spe.ch)

# Dendrograma reordenado con etiquetas de grupo.

plot(
  spe.chwo,
  xlab = "4 grupos",
  ylab = "Altura",
  main = "Chord - Ward (reordenada)",
  labels = cutree(spe.chwo, k = 4)
)
# Graficar el dendrograma con colores
rect.hclust(spe.chwo, k = 4, border = c("red","green3","blue","cyan"))



