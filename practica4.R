install.packages("git")
install.packages("LaTeX")
install.packages("knitr")

library(tinytex)
tinytex::install_tinytex()

x <- rnorm(1000)
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
