#Uso de R en Biogeografía

#Calculadora
1+5
4/3
log(20)
47*35
sqrt(4)
78^4
sin(pi/2)

#Variables en R
x=4
1x=4
x1=1
x 1=1
X1=4
X1=8 
x1+X1

#Remover elementos 
rm(x)

#Secuencias de números
1:10
10:1
seq(0,10,0.5)

#Vector
a = c(1,2,5.3,6,2,4) # vector numerico
b = c("Fissurella peruviana","Felicioliva peruviana","Echinolittorina peruviana") # vector de caracter
c = c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) # vector logico
d = factor(c("masculino","femenino","femenino","femenino","masculino")) #vector de factores

#matriz
matriz=matrix(1:15, nrow=5,ncol=3)
matriz

#arreglo
arreglo = array(1:24, dim=c(3,4,2))
arreglo


#dataframe
data.frame(1,"Cornu aspersum", TRUE)

data.frame(Sexo=d, cod=1:5, ADN=TRUE)

data.frame(Sexo=d, cod=1:10, ADN=TRUE)

data.frame(Sexo=d, cod=1:11, ADN=TRUE)

#lista
w = list(name="Monitoreo", Especies=b, mymatrix=matriz, Area=10)
w

#Directorio
getwd()
setwd()

# Cargar los datos
spe = read.csv("spe.csv", header = T)

# Exploración de un dataframe usando funciones básicas de R =============

spe                       # Mostrar la data en la consola
spe[1:5, 1:10]            # Mostrar las primeras 5 filas y 10 columnas
head(spe)                 # Mostrar las 6 primeras filas
tail(spe)                 # Mostrar las 6 últimas filas
nrow(spe)                 # Número de filas
ncol(spe)                 # Número de filas
dim(spe)                  # Dimensiones del dataframe
colnames(spe)             # Etiquetas de las columnas
rownames(spe)             # Etiquetas de las filas
summary(spe)              # Estadísticos descriptivos por columnas

