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
   #todos los valores de un vector. el 50% de los datos son mayores que la mediana 
   #y el otro 50% son menores que la mediana.

#4 Calcular la moda
mode(numArtefactos_int) #si corremos este comando, nos da como 
                        #resultado el tipo de objeto; primero tendremos
                        #que hacer una tabla de frecuencias.
#podemos obtener una función que calcule la moda de un vector con el
#paquete modeest; que nos dará acceso a la función mfv.
install.packages("modeest")
library(modeest)
moda <- mfv(numArtefactos_int)
moda
#La moda es el valor que más se repite en un conjunto de datos, y se 
#calcula contando la frecuencia de cada valor en el conjunto de datos
#y viendo cuáles de ellos tienen mayor frecuencia.

#5 Calcular el número de veces que se repite el valor de moda
tablaNAI <- table(numArtefactos_int)
tablaNAI
repeticiones <- max(tablaNAI)
repeticiones
#con la función max calculamos el número máximo de veces que se repite
#un valor en la tabla de frecuencias que hemos creado (tablaNAI)
cat("La moda es", moda, "y se repite", repeticiones, "veces.")
#con la función cat lo que hacemos es imprimir los resultados creados
#(moda y repeticiones) para que sea legible.

#6 Calcular los cuartiles
cuartiles <- quantile(numArtefactos_int, c(0.25, 0.5, 0.75))
cuartiles 
#Los cuartiles son medidas de posición, dividen la dispersión de la frecuencia 
#en partes iguales. Esto permite clasificarlos en grupos iguales.
#el resultado que nos da la funció "quantile" que sirve para calcular
#los cuartiles es al 25% 21.25; 50% 40.5; y al 75% 61.5.

#7 Calcular rango intercuarlítico
#lo que queremos saber es el número de unidades que existen entre el
#primer cuartil (25%) y el tercer cuartil (75%). Para ello; usamos la 
#función IQR
r_intercuarlitico <- IQR(numArtefactos_int)
r_intercuarlitico

#8 Calcular el rango de un vector. El rango es la diferencia que existe
#entre el valor mínimo de un vector y su valor máximo
rango_artefactos <- diff(range(numArtefactos_int))
rango_artefactos
#diff nos sirve para calcular la diferencia entre los valores mín y max
#que calculamos con la función range.

#9 Calcular la varianza 
#La varianza es la dispersión de los datos alrededor de su media
varianza <- var(numArtefactos_int)
varianza
varianza2 <- sum((numArtefactos_int - mean(numArtefactos_int))^2) / (length(numArtefactos_int) - 1)
varianza2
#con la función var hacemos el cálculo directamente; con la segunda 
#propuesta estamos realizando todos los cálculos necesarios.