library(ggplot2)
library(psych)

file <- file("data.csv", open="r", encoding="shift-jis")
data <- read.table(file, header=T, sep=",", fill = TRUE)

pairs(data)
pairs.panels(data, hist.col = "white", lm=T, ellipses=F)

factor1 = data$factor1
factor2 = data$factor2
factor3 = data$factor3


results <- lm(factor1~factor2+factor3)

rs <- summary(results)$r.squared
1/(1-rs)

summary(results)

png("glm.png", width = 1000, height = 700, pointsize = 3, res=500)

plot(factor2, factor1)
abline(results, col="red")

dev.off()