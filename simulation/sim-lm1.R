# Simulation in Linear Regression

x = seq(90:110)
length(x)
y1 = x + rnorm(length(x))
plot(y1 ~ x)
lm(y1 ~ x)
abline(lm(y1 ~ x))

#run again
length(x)
y2 = x + rnorm(length(x))
plot(y2 ~ x)
fit2 = lm(y2 ~ x)
fit2
abline(fit2)
coefficients(fit2)
coefficients(fit2)[2]

#Method3
N=50
(slope_sim = numeric(N)) #blank vector of 40 columns with 0 slope

for (i in 1:N){
  y = x + rnorm(length(x))
  y.lm = lm(y~x)
  slope_sim[[i]] = as.vector(y.lm$coefficients[2])
  }
slope_sim
#this is slope for different values of y from single set of x
plot(density(slope_sim))
Hmisc::describe(slope_sim)
mean(slope_sim)  #meain 1
sd(slope_sim)
sd(slope_sim)/sqrt(N)  #SSE - Least Square estimate

