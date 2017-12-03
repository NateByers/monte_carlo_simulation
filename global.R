library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)

cars <- mtcars %>%
  dplyr::mutate(wt = wt*1000)
cars_sigma <- cor(cars[, c("cyl", "hp", "wt")])
mus <- colMeans(cars[, c("cyl", "hp", "wt")])
sds <- sapply(cars[, c("cyl", "hp", "wt")], sd)

lm_fit <- lm(mpg ~ cyl + hp + wt, data = cars)

lm_formula <- formula(lm_fit)
lm_formula <- paste0(lm_formula[2], " = ", lm_formula[3])

plot_distribution <- function(mu, stdv) {
  # mu <- mean(cars$InjPress); stdv <- sd(cars$InjPress)
  xseq <- seq(mu - 4*stdv, mu + 4*stdv, .01*stdv)
  densities<-dnorm(xseq, mu, stdv)
  plot(xseq, densities, col="darkgreen",xlab="", ylab = "", yaxt = "n", type="l",
       lwd=2, cex=2, main="Preview", cex.axis=.8)
}

simulate_data <- function(n, sigma = cars_sigma, mus, sds) {
  # https://stats.stackexchange.com/questions/46429/transform-data-to-desired-mean-and-standard-deviation
  
  # n <- 100; sigma = matrix(.7, nrow=3, ncol=3) + diag(3)*.3; mus <- colMeans(cars[c("InjPress",   "InjTemp" ,"CoolTemp")]); sd <- sapply(cars[c("InjPress",   "InjTemp" ,"CoolTemp")], sd)
  sims <- MASS::mvrnorm(n = n, mu = rep(0, 3), Sigma = sigma, empirical = TRUE)
  
  for(i in seq_along(mus)) {
    sims[, i] <- sds[i]*sims[, i] + mus[i]
  }
  
  sims <- as.data.frame(sims)
  names(sims) <- c("cyl", "hp", "wt")
  
  sims
}
