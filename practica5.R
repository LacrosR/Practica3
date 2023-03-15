set.seed(2)
y1 <- rnorm(1000) * 12
y2 <- rexp(1000) / 7

t.test(y1)
t.test(y2)

boxplot(y1)
boxplot(y2)
