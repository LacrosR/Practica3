install.packages("MASS")
library(MASS)
install.packages("caret")
library(caret)
install.packages("stats")
library(stats)
install.packages("olsrr")
library(olsrr)
install.packages("kableExtra")
library(kableExtra)
install.packages("knitr")
library(knitr)
install.packages("rmarkdown")
library(rmarkdown)

install.packages("devtools")
library(devtools)
install_version("kable", version = "4.2.2", repos = "http://cran.us.r-project.org")

y_cuentas <- c(110,2,6,98,40,94,31,5,8,10)
y_cuentas
x_distancias <- c(1.1,100.2,90.3,5.4,57.5,6.6,34.7,65.8,57.9,86.1)
x_distancias

cor(x_distancias, y_cuentas)
cor.test(x_distancias, y_cuentas)
plot(x_distancias, y_cuentas)

hist(x_distancias, prob=TRUE)
lines(density(x_distancias))

shapiro.test(x_distancias)

xy <- x_distancias*y_cuentas
xy

x_cuadrado <- x_distancias^2
x_cuadrado

tabla_datos <- data.frame(y_cuentas, x_distancias, xy, x_cuadrado)
tabla_datos

library(kableExtra)
tablakable <- kable(tabla_datos)
as_image(tablakable)
kbl(tabla_datos) %>%
  kable_minimal()

x_latex <- knitr::kable(head(mtcars), "latex")
kable_styling(x_latex, latex_options = "striped", position = "float_left")

sum_y <- sum(tabla_datos$y_cuentas)
sum_y
sum_x <- sum(tabla_datos$x_distancias)
sum_x
sum_xy <- sum(tabla_datos$xy)
sum_xy
sum_x2 <- sum(tabla_datos$x_cuadrado)
sum_x2

sumatorios <- c(sum_y, sum_x, sum_xy, sum_x2)
tabla_datos2 <- rbind(tabla_datos, sumatorios)
tabla_datos2
rownames(tabla_datos2)[11] <- "sumatorio"
rownames(tabla_datos2)[11]

sum_xy - (sum_x*sum_y)
sum_x2 - (sum_x^2)
B1 <- -197220.7/-217757.7
B1

datos <- data.frame(x_distancias, y_cuentas)
data <- data.frame(y_cuentas, x_distancias)
data
modelo <- lm(y_cuentas ~ x_distancias, datos)
summary(modelo)
plot(x_distancias, y_cuentas)
abline(modelo)

plot(x_distancias, y_cuentas, main="Gráfico de dispersión con recta de regresión", xlab= "Distancia en km", ylab= "Número de cuentas")

resid(modelo)
rstandard(modelo)
rstudent(modelo)

y_6.6 <- 95.36 - 1.082 * 6.6
y_6.6

install.packages("dplyr")
library(dplyr)
library(caret)
entrenamiento <- data_df %>%
  createDataPartition(p=.8, list=FALSE)
entrenamiento <- data_df[-entrenamiento]
test <- data_df[entrenamiento]
entrenamiento
test

data
str(data)
typeof(train_df)
data_df <- as.data.frame(entrenamiento)
is.data.frame(entrenamiento)


train <- data_df %>% dplyr::sample_frac(.8)
test <- dplyr::anti_join(data_df, train)
train
test

modelo_train <- lm(y_cuentas ~ x_distancias, train)
summary(modelo_train)
plot(train)
abline(modelo_train)

anova(modelo_train)
var_total <- var(train_df$y)
var_total
var_explicada <- sum((modelo_train$fitted.values - mean(train_df$y))^2)
var_explicada
var_no_explicada <- sum((train_df$y - modelo_train$fitted.values)^2)
var_no_explicada

plot(train_df)

y_train <- c(94, 10, 2, 40, 110, 6, 5, 98)
x_train <- c(6.6, 86.1, 100.2, 57.5, 1.1, 90.3, 65.8, 5.4)
train_df <- data.frame(y_train, x_train)
train_df2 <- data.frame(train)
train_df2
is.data.frame(train_df2)

predicciones <- predict(modelo_train, newdata = test)
predicciones
error_cuadratico_medio <- sqrt(mean((test$y - predicciones)^2))
error_cuadratico_medio

ajuste <- function(datos, indices){
  modelo <- lm(y ~ x1 + x2 + x3, data = datos[indices, ])
  return(modelo)
}
cv <- cv.glm(datos, modelo, K = 10, fit = ajuste)

cooksd <- cooks.distance(modelo_train)
plot(cooksd, pch = 20, main = "Distancia de Cook")
abline(h = 3/length(cooksd), col = "red")

residuos_train <- resid(modelo_train)
plot(modelo_train$fitted.values, residuos_train, xlab = "Valores ajustados", ylab = "Residuos", main = "Gráfico de residuos")

library(lmtest)
bp <- bptest(modelo_train)
bp


library(dplyr)
data <- data.frame(x_distancias, y_cuentas)
plot(data)
train <- data %>% dplyr::sample_frac(.8)
test <- dplyr::anti_join(data, train)
train
test


library(tinytex)

tinytex::tlmgr_repo('https://ctan.uib.no/systems/texlive/tlnet/')

tinytex::tlmgr_install('multirow')
