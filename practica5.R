#1
set.seed(1)
z <- rnorm(100)
x <- rpois(100, 10.3)
y <- rbinom(100, 1, 25)

y1 <- 5*z+x*10+rnorm(100, 2, 1)
y2 <- 5*z+x*12+rnorm(100, 2, 1)

t.test(y1)
t.test(y2)

boxplot(y1)
boxplot(y2)

#2
# Decimos que la correlación lineal es una prueba paramétrica
#porque asume que los datos siguen una distribución normal o gaussiana y 
#que la relación entre las variables sigue una forma lineal.


install.packages("correlation")
library(correlation)
correlation(data)


pval <- corr.test(data)$p.value
library(corrplot)
correlacion <- cor(data)
corrplot(correlacion)

install.packages("GGally")
install.packages("generics")
library(GGally)
cor_matrix <- cor(data)
pval_matrix <- cor.mtest(data)$p
ggcorr(cor_matrix, p.mat = pval_matrix, label = TRUE, label_round = 2)

install.packages("psych")
library(psych)
corr_matrix <- corrwithCI(data, ci=0.95)


install.packages("Hmisc")
library(Hmisc)

corr_matrix <- rcorr(as.matrix(data))
corr <- corr_matrix$r
p_values <- corr_matrix$P
ci <- matrix(NA, ncol = ncol(corr), nrow = nrow(corr))
for(i in 1:nrow(corr)) {
  for(j in 1:ncol(corr)) {
    ci[i,j] <- paste0("[", round(corr_matrix$lower[i,j],2), ", ", round(corr_matrix$upper[i,j],2), "]")
  }
}

library(ggplot2)
ggplot(data, aes(peso, longitud))+ 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

distancia <- c(1.1,100.2,90.3,5.4,57.5,6.6,34.7,65.8,57.9,86.1)
n_piezas <- c(110,2,6,98,40,94,31,5,8,10)

cor(distancia, n_piezas)

test_t <- t.test(data2)
test_t$p.value 
test_t$statistic

data2 <- data.frame(distancia, n_piezas)
correlation::correlation(data2)

correlacion3 <- correlation::correlation(data)
correlacion3
