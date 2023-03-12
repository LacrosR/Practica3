#1 crear vector.
numArtefactos <- c(17, 54, 10, 34, 90, 33, 49, 82, 12, 23, 56, 78, 44, 
                   102, 10, 53, 4, 28, 37, 95)
#está trabajando con datos dobles como comprobamos con este comando
typeof(numArtefactos)
#convertimos a datos integer con:
numArtefactos_int <- as.integer(numArtefactos)
typeof(numArtefactos_int)

#2 Calcular la media
media <- mean(numArtefactos_int) 
media #El resultado es 45.55


#3 Calcular la mediana
mediana <- median(numArtefactos_int) 
mediana #El resultado es 40.5
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
varianza2 <- sum(
  (numArtefactos_int - mean(numArtefactos_int))^2) / 
  (length(numArtefactos_int) - 1)
varianza2 # El resultado es igual a 927.1026
#con la función var hacemos el cálculo directamente; con la segunda 
#propuesta estamos realizando todos los cálculos necesarios.

#10 Desviación estándar
desviacion <- sd(numArtefactos_int) 
desviacion #nos da como resultado 30.44836
#también podemos calcularla como el cuadrado de la varianza. 
sqrt(varianza) #que también nos da como resultado 30.44836

#11 La principal diferencia es que la varianza se experesa en 
#unidades al cuadrado, mientras que la desviación estándar
#se expresa en las mismas unidades de los datos originales.
#Es por esta razón que podemos calcular la desviación estándar como
#la raíz cuadrada de la varianza.
#Ambas son medidas de variabilidad en un conjunto de datos.

#12 Gráfico de dispersión
boxplot(numArtefactos_int, horizontal=TRUE, 
        main="Gráfico de dispersión del número de Artefactos")
#utilizamos la función "boxplot" para generar un gráfico de dispersión
#de nuestro vector; añadimos el argumento "horizontal=TRUE", para que
#sea horizontal y no vertical, y el argumento "main" para darle un nombre.

#13 vector 3
vector3 <- c(21, 45, 33, 98, 34, 90, 67, 87, 45, 11, 73, 38, 28, 15, 50, 57, 
             12, 87, 29, 1)

#14 Coeficiente de desviación
desviaciónV3 <- sd(vector3)
mediaV3 <- mean(vector3)

CVnumArt <- (desviacion/media) *100 #Calculo de coeficiente de
CVnumArt                        #desviacion vector NumArtefactos_int

CV3 <- (desviaciónV3/mediaV3) *100 #Coeficiente desviacion vector3
CV3

#Los coeficientes de desviación de estos2 vectores son parecidos
#ambos aportando una variación de entre el 60-70%; por lo que podemos
#saber que ambos tienen una variablidad parecida, teniendo una mayor
#el conjunto de datos "numArtefactos_int".


#15 tabla resumen
datos <- data.frame (media, mediana, moda, varianza, desviacion)
datos
summary(numArtefactos_int)
#con la primera opción generamos una tabla con los datos previamente
#ontenidos. La segunda es una función que nos aporta algunos de estos 
#datos automáticamente

#16 coeficiente de asimetría
install.packages("e1071")
library(e1071)
skewness(vector3) #El resultado es 0.3138528
#El coeficiente de asimetría generado mediante la función "skewness"
#del paquete "e1071", es un tipo de dato que nos indica la asimetría
#de un conjunto de datos; cuanto más se acerque al 0, más simétricos
#serán los datos. 
#Una distribución simétrica tiene un coeficiente de asimetría de cero, 
#mientras que una distribución sesgada a la derecha tiene un 
#coeficiente de asimetría positivo y una distribución sesgada a la 
#izquierda tiene un coeficiente de asimetría negativo.

#17 Calcular la curtosis
install.packages("moments")
library(moments)
kurtosis(vector3) #el valor es igual a 1.952376
#La curtosis indica el grado de concentración que tienen los datos
#en su región central, respecto al total de los datos. La concetración
#o curtosis normal sería de 3. Ya que nuestra curtosis es de 1.9, eso
#quiere decir que tiene más datos en las colas de la distribución
#que en la región central. Si fuera mayor que 3, tendría más datos
#en la región central que en las colas de distribución. 
#El nombre que recibe la curtosis asociada al vector3 es "platicúrtica".