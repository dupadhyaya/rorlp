# Monte Carlo Sim 2
#https://firstdifferences.wordpress.com/category/r/

library(MonteCarlo)
set.seed(123)

mean_vs_median<-function(n, out){
  
  # generate sample
  sample<-rnorm(n, 0, 1)
  
  # add outlier
  sample[1]<-sample[1]+out
  
  # calculate estimators
  mean_sample<-mean(sample)
  median_sample<-median(sample)
  
  # return results
  return(list("mean"=mean_sample, "median"=median_sample))
}

erg_mean_median<-MonteCarlo(func=mean_vs_median, nrep=1000, param_list=list("n"=c(5, 25, 250), "out"=c(0, 3, 5)))
summary(erg_mean_median)

df<-MakeFrame(erg_mean_median)
head(df)

library(tidyverse)
tbl <- tbl_df(df)
tbl

ggplot(filter(tbl, out==0)) + 
  geom_density(aes(x=mean, col=factor(n), linetype="mean")) +
  geom_density(aes(x=median, col=factor(n), linetype="median"))

tbl %>% filter(out==0) %>% group_by(n) %>% summarise_each("sd") %>% round(digits=2)

ggplot(filter(tbl, n==25)) + 
  geom_density(aes(x=mean, col=factor(out), linetype="mean")) +
  geom_density(aes(x=median, col=factor(out), linetype="median"))


ggplot(filter(tbl)) + 
  geom_density(aes(x=mean, col=factor(out), linetype=factor(n)))
