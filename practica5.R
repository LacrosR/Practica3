#1 crear vector.
numArtefactos <- c(17, 54, 10, 34, 90, 33, 49, 82, 12, 23, 56, 78, 44, 
                   102, 10, 53, 4, 28, 37, 95)
#está trabajando con datos dobles como comprobamos con este comando
typeof(numArtefactos)
#convertimos a datos integer con:
numArtefactos_int <- as.integer(numArtefactos)
typeof(numArtefactos_int)

#2 Calcular la media
mean(numArtefactos_int) #El resultado es 45.55

#3 Calcular la mediana
median(numArtefactos_int) #El resultado es 40.5
#La mediana es el valor que se encuentra en el posición intermedia de 
   #todos los valores de un vector. Se Calcula
