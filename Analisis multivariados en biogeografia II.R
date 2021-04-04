#Analisis multivariados en biogeografia II =======================
spe = read.csv(file = "spe.csv", header = T)
spa = read.csv(file = "spa.csv", header = T)

# Remueve el sitio 8
spe = spe[-8, ]
spa = spa[-8, ]

## Matriz disimilitud
library(vegan)
?metaMDS
spe.nmds = metaMDS(spe, distance = "bray")

spe.nmds
spe.nmds$stress

plot(spe.nmds,type = "t",cex=1.5,
     main = paste("NMDS - Diferencia de porcentajes - Stress =",
                  round(spe.nmds$stress, 3)))

# Shepard plot y bondad de ajuste
par(mfrow = c(1, 2))
stressplot(spe.nmds, main = "Shepard plot")
gof = goodness(spe.nmds)
plot(spe.nmds, type = "t", main = "Bondad de ajuste")
points(spe.nmds, display = "sites", cex = gof * 300)
dev.off()

# Anadir colores del agrupamiento al cluster
# Extraccion de grupos
spe.norm = decostand(spe, method = "normalize")
spe.ch = vegdist(spe.norm, method = "bray")
spe.ch.ward = hclust(spe.ch, method = "ward.D")
spech.ward.g = cutree(spe.ch.ward, k = 4)

# Combinacion resultados del NMDS
color = c("red","green3","blue","cyan")
plot(spe.nmds, type = "n", display = "sites")
points(spe.nmds, col = color[spech.ward.g], 
       bg = color[spech.ward.g], pch = 21, cex = 1.5)
legend("bottomleft", legend = paste("Grupos", 1:4),
       col = color, pt.bg = color, bty = "n", pch = 21, cex = 1.5)

# Graficar los agrupamientos en el mapa
drawmap(xy = spa,
        clusters = spech.ward.g)

