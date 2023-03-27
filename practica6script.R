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
