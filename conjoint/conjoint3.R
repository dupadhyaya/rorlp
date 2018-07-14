#Conjoint Analysis

#https://cran.r-project.org/web/packages/radiant.multivariate/radiant.multivariate.pdf

result <- Conjoint(mp3, rvar = "Rating", evar = "Memory:Shape")
plot(result, scale_plot = TRUE)
plot(result, plots = "iw")