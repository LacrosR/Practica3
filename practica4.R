install.packages("git")
install.packages("LaTeX")
install.packages("knitr")

library(tinytex)
tinytex::install_tinytex()

x <- rnorm(1000)
hist(x)
