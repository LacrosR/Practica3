# Ejercicio 1:
# Las variables contenidas en el tabla de datos "spearheads" corresponden a las
# siguientes categorías:
# CUALITATIVAS NOMINALES: Material, Contexto, Loop y Remache 
# CUALITATIVAS ORDINALES: Conservación
# INTERVALO: Fecha
# CUANTITATIVAS: LongitudMax, LongitudCubo, AnchoMax, AnchoCuboSup, 
                #AnchoCuboInf, LongAnchoMax y Peso

# Ejercicio 2:
# Para crear un nuevo proyecto en RStudio nos vamos al icono ubicado en la esquina
#superior derecha del programa, clicamos en directorio existente y escogemos
#una carpeta de nuestro pc donde se almacenarán todos los datos y scripts relativos
#al proyecto. El nombre de la carpeta seleccionada dictará el nombre del proyecto.
# Se aconseja que la ruta no sea excesivamente larga, por lo que este proyecto se 
#aloja en el disco C:, sin extender más la ruta del archivo. 
# Podemos comprobar el directorio en el que se ubica con el comando:
getwd() #Resultado:[1] "C:/claseR/PracticaManuel"
# Y podemos cambiar nuestro directorio en caso de necesitarlo con el comando:
setwd() #especificando en esta función la nueva ruta.

# Ejercicio 3:
# Para importar la tabla de datos podemos hacer uso del comando:
SH <- read.csv("spearheads.csv")
# Es importante que el archivo que queramos abrir esté dentro del directorio de
#nuestro proyecto.
# Lo que hemos hecho con el comando es crear un objeto llamado SH con la función
#"<-" y le hemos dicho que los valores asociados de ese objeto provienen de 
#la tabla de valores "spearheads", que el programa puede leer gracias a la función
#"read.csv". Ahora tenemos el objeto SH (nuestra tabla de valores), ubicada
#en el panel izquierdo superior, en la pestaña de enviroment, y podemos ver
#lo que contiene clicando sobre ella.

# Ejercicio 4:
# Para renombrar las variables haremos uso del comando:
colnames(SH) <- c("Caso", "Material", "Contexto", "Loop", "Remache", 
                  "Conservacion", "Fecha", "LongitudMax", "LongitudCubo", 
                  "AnchoMax", "AnchoCuboSup", "AnchoCuboInf", "LongAnchoMax", 
                  "Peso")
# La función "colnames" nos sirve para editar los nombres de las columnas de 
#nuestra tabla de valores, luego asignamos mediante un vector "c" un nuevo
#nombre para cada variable. Mediante este método necesitamos nombrar a todas
#las columnas de manera ordenada (de izquierda a derecha).

# Ejercicio 5:
# Para asignarle etiquetas a las variables cualitativas podemos hacer uso
#del siguiente código:
SH$Material <- ordered(SH$Material, levels <- c(1,2), labels <- c("Bronce", "Hierro"))
SH$Contexto <- ordered(SH$Contexto, levels <- c(1,2,3), 
                       labels <- c("Aislado", "Asentamiento", "Enterramiento"))
SH$Loop <- ordered(SH$Loop, levels <- c(1,2), labels <- c("No", "Si"))
SH$Remache <- ordered(SH$Remache, levels <- c(1,2), labels <- c("No", "Si"))
SH$Conservacion <- ordered(SH$Conservacion, levels <- c(1,2,3,4), 
                           labels <- c("Excelente", "Buena", "Suficiente", "Pobre"))
# Este código funciona de manera similar al del anterior ejercicio. Primero
#necesitamos llamar a las columnas a las que le vamos a sustituir los valores,
#y después con la función "ordered" sustituiremos los valores numéricos "levels"
#por alfanuméricos "labels". 

# Ejercicio 6:
# Para generar tablas de frecuencia usamos la función "table"; para almacenar
#los valores de estas tablas los guardamos como objetos con la función "<-". 
#A la función table solo tenemos que darle la variable de nuestra tabla de datos
#que queremos que convierta en tabla de frecuencia, para lo que usaremos
#el operador "$".
TablaMat <- table(SH$Material)
TablaMat
TablaCont <- table(SH$Contexto)
TablaCont
TablaCons <- table(SH$Conservacion)
TablaCons

# Ejercicio 7:
# Para generar tablas cruzadas también podemos usar la función "table", separando
#con "," las diferentes variables que queremos cruzar.
MatCont <- table(SH$Material, SH$Contexto)
MatCont
MatCons <- table(SH$Material, SH$Conservacion)
MatCons

# Ejercicio 8:
# Para poder generar tablas con porcentajes primero es necesario convertir 
#las tablas de frecuencia en dataframes. Para ello utilizaremos la función
#"data.frame"
MatDF <- data.frame(TablaMat)
ContDF <- data.frame(TablaCont)
ConsDF <- data.frame(TablaCons)
# El código que utilizamos para crear estos objetos que contienen los porcentajes
#de nuestras variables es la operación matemática necesaria para calcularlos.
PorcMat <- with(MatDF, Freq/sum(Freq) * 100)
PorcMat
PorcCont <- with(ContDF, Freq/sum(Freq) * 100)
PorcCont
PorcCons <- with(ConsDF, Freq/sum(Freq) * 100)
PorcCons

# Ejercicio 9:
#Para generar tablas de frecuencia usamos la función "table"; para almacenar
#los valores de estas tablas los guardamos como objetos con la función "<-". 
#A la función table solo tenemos que darle la variable de nuestra tabla de datos
#que queremos que convierta en tabla de frecuencia, para lo que usaremos
#el operador "$".
TablaMat <- table(SH$Material)
TablaMat
TablaCont <- table(SH$Contexto)
TablaCont
TablaCons <- table(SH$Contexto)

# Ejercicio 10:
# Para generar gráficos de barras verticales usamos la función "barplot" y le
#damos una tabla de frecuencias como las previamente generadas.
#Podemos cambiar el color del gráfico con el argumento "col"
barplot(TablaMat)

barplot(TablaCons, col="red")

barplot(TablaCont, col= c("green", "blue", "yellow"))
#Para hacer los gráficos de barras horizontales añadimos el argumento 
#"horiz=TRUE"
barplot(TablaMat, horiz=TRUE)
barplot(TablaCons, col="red",  horiz=TRUE)
barplot(TablaCont, col= c("green", "blue", "yellow"),  horiz=TRUE)

# Ejercicio 11:
# Para poder agrupar los datos de la variable de conservación sobre los de material
#creo una nueva tabla en la que las variables aparezcan en este orden:
ConsMat <- table(SH$Conservacion, SH$Material)
# Luego utilizo la función barplot para generar la gráfica:
#El argumento "main" sirve para darle un nombre a la gráfica
#El argumento "beside=TRUE" sirve para separar en por columnas los valores de la
#variable de material
#El argumento "col" es para darle colores que puedan identificarse según el 
#nivel de conservación
barplot(ConsMat, col= c("blue", "green", "yellow", "red"), 
        main= "Nivel de Conservación agrupado por material", beside=TRUE)

#La función legend sirve para darle una leyenda a la gráfica:
#el argumento "bottomleft" indica la posición de la leyenda en este caso
#en la esquina inferior izquierda
#el siguiente argumento sirve para incluir el texto en la leyenda
#"title" le proporciona el título
#y "fill" nos proporciona los colores
legend("bottomleft", c("Excelente", "Bueno", "Regular", "Malo"), 
       title= "Estado de Conservación", fill=c("blue", "green", "yellow", "red"))

# Ejercicio 12:
# Para generar gráficos de barra utilizamos la función "pie".
# También genero las etiquetas necesarias para incluir la frecuencia absoluta
#y el porcentaje antes de generar la gráfica, mediante la creación de un 
#objeto llamado "lbls" que contiene estos datos.
#También genero una leyenda, de igual forma que en el ejercicio anterior.
Porlbl <- c("20","45","22.5","12.5")
Porlbl
Conslbl <- c("8", "18", "9", "5")
lbls <- paste(Conslbl, Porlbl)
lbls <- paste(lbls,"%",sep="")
PieCons <- pie(PorcCons, col= c("blue", "green", "yellow", "red"), labels= lbls)
legend("bottomleft", c("Excelente", "Bueno", "Regular", "Malo"), 
       title= "Estado de Conservación", fill=c("blue", "green", "yellow", "red"))

# Ejercicio 13:
# Antes de hacer nuestros histogramas necesitamos crear un segundo conjunto
#de datos que no contengan valores vacíos, porque si estos existen no
#podremos graficar histogramas. Para ello utilizamos el código:
SH2 <- na.omit(SH)
#Ahora podemos crear histogramas con la función "hist" dándole una variable
#de nuestro nuevo conjunto de datos con el operador "$". Además tenemos los
#argumentos:
#"Prob=T" para que el eje Y grafique unos valores porcentuales
#"main" para darle título
#y "xlab" e "ylab" para dale nombre a los ejes X e Y.
hist(SH2$LongitudMax, prob= T, main="Histograma de la longitud máxima", 
     xlab="Longitud máxima (cm)", ylab="Frecuencia")
#Ahora calculamos la curva de distribución normal mediante la siguiente operación
#que usa la función "dnorm" que nos sirve para este propósito.
CurLonMax <- dnorm(SH2$LongitudMax, mean = mean(SH2$LongitudMax), 
                   sd = sd(SH2$LongitudMax))
curve(dnorm(x, mean = mean(SH2$LongitudMax), sd = sd(SH2$LongitudMax)), 
      add = TRUE, col = "blue", lwd=4)
#Por último calculamos la densidad y la graficamos dentro de nuestro gráfico con 
#las funciones "Density" y "lines" respectivamente.
DLM <- density(SH2$LongitudMax)
lines(DLM, lwd = 4, col="red")
#Ahora repetimos estos pasos para el resto de variables
hist(SH2$LongitudCubo, prob= T, main="Histograma de la longitud del cubo", 
     xlab="Longitud del cubo (cm)", ylab="Frecuencia")
curve(dnorm(x, mean = mean(SH2$LongitudCubo), sd = sd(SH2$LongitudCubo)), 
      add = TRUE, col = "blue", lwd=4)
DenLonEnc <- density(SH2$LongitudCubo)
lines(DenLonEnc, lwd=5, col= "red")

hist(SH2$AnchoMax, prob= T, main="Histograma del Ancho Máximo", 
     xlab="Ancho Máximo (cm)", ylab="Frecuencia")
curve(dnorm(x, mean = mean(SH2$AnchoMax), sd = sd(SH2$AnchoMax)), 
      add = TRUE, col = "blue", lwd=4)
DenAncMax <- density(SH2$AnchoMax)
lines(DenAncMax, lwd = 4, col="red")

hist(SH2$AnchoCuboSup, prob= T, main="Histograma del Ancho del Cubo Superior", 
     xlab="Ancho del cubo superior(cm)", ylab="Frecuencia")
curve(dnorm(x, mean = mean(SH2$AnchoCuboSup), sd = sd(SH2$AnchoCuboSup)), 
      add = TRUE, col = "blue", lwd=4)
DenAncEnc <- density(SH2$AnchoCuboSup)
lines(DenAncEnc, lwd = 4, col="red")

hist(SH2$AnchoCuboInf, prob= T, main="Histograma del Ancho del Cubo Inferior", 
     xlab="Ancho del cubo inferior (cm)", ylab="Frecuencia")
curve(dnorm(x, mean = mean(SH2$AnchoCuboInf), sd = sd(SH2$AnchoCuboInf)), 
      add = TRUE, col = "blue", lwd=4)
DenMaxEnc <- density(SH2$AnchoCuboInf)
lines(DenMaxEnc, lwd = 4, col="red")

hist(SH2$LongAnchoMax, prob= T, main="Histograma de la longitud del ancho máximo", 
     xlab="Longitud del ancho máximo (cm)", ylab="Frecuencia")
curve(dnorm(x, mean = mean(SH2$LongAnchoMax), sd = sd(SH2$LongAnchoMax)), 
      add = TRUE, col = "blue", lwd=4)
DenAncMaxEnc <- density(SH2$LongAnchoMax)
lines(DenAncMaxEnc, lwd = 4, col="red")

hist(SH2$Peso, prob= T, main="Histograma del Peso", 
     xlab="Peso (g)", ylab="Frecuencia")
curve(dnorm(x, mean = mean(SH2$Peso), sd = sd(SH2$Peso)), 
      add = TRUE, col = "blue", lwd=4)
DenAncMaxEnc <- density(SH2$Peso)
lines(DenAncMaxEnc, lwd = 4, col="red")

#Ejercicio 14:
# Para hacer un gráfico de caja y bigotes usamos la función "boxplot" con
#las variables de nuestro conjunto de datos
boxplot(SH$LongitudMax)
boxplot(SH$LongitudCubo)
boxplot(SH$AnchoMax)
boxplot(SH$AnchoCuboSup)
boxplot(SH$AnchoCuboInf)
boxplot(SH$LongAnchoMax)
boxplot(SH$Peso)

# Ejercicio 15:
# Para generar gráficos de violín primero necesitaremos cargar la librería
#vioplot porque la función que necesitamos "vioplot" se encuentra dentro de esta.
#Luego solo utilizamos la función sobre nuestras variables.
library(vioplot)
vioplot(SH$LongitudMax)
vioplot(SH$LongitudCubo)
vioplot(SH$AnchoMax)
vioplot(SH$AnchoCuboSup)
vioplot(SH$AnchoCuboInf)
vioplot(SH$LongAnchoMax)
vioplot(SH$Peso)
