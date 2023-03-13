install.packages("git")
install.packages("LaTeX")
install.packages("knitr")

library(tinytex)
library(knitr)
library(markdown)
tinytex::install_tinytex()



hist(x)

y <- runif(1000)
hist(y)
rnorm(5)
rnorm(5)

set.seed(1)
rnorm(5)
rnorm(10)

set.seed(1)
rnorm(5)

x <- rnorm(1000)
shapiro.test(x)

z <- rexp(1000)
shapiro.test(z)

#Shapiro test comprueba si la población de datos tiene una distribución 
#normal. Esto se mira con el p value, si es superior a 0'05 indica que la 
#población es probablemente normal. Si no lo fuera, significaría que tiene 
#una distribución distinta a la normal
