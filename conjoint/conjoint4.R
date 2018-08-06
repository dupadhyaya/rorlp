#Conjoint  
#https://cran.r-project.org/web/packages/radiant.multivariate/radiant.multivariate.pdf

library(radiant.multivariate)
data(mp3)
mp3
cmp3 <- conjoint(mp3, rvar = "Rating", evar = "Memory:Shape") %>% str()
conjoint1 = conjoint(mp3, rvar='Rating', evar = "Memory:Shape", int = "", by = "none", reverse = FALSE,
         data_filter = "")

plot(x=conjoint1, plots = "pw", show = "", scale_plot = FALSE,
     shiny = FALSE, custom = FALSE)

data = mp3
data = as.data.frame(lapply(mp3, as.factor))
str(data)
data
hclus(data, vars=c('Memory', 'Radio', 'Size', 'Price', 'Shape'), distance = "sq.euclidian", method = "ward.D",  max_cases = 5000, data_filter = "")


#shopping
str(shopping)
hclus(shopping, vars = "v1:v6") %>% str()
hc1  =hclus(shopping, vars = "v1:v6")
hc1
plot(hc1)
summary.hclus(hc1)
plot.hclus(hc1)
plot(hc1, plots = c("scree", "change"), cutoff = 0.05,
     shiny = FALSE, custom = FALSE)


kcluster1 =kclus(data, vars=c('Memory', 'Radio', 'Size', 'Price', 'Shape'), fun = "mean", hc_init = TRUE,    distance = "sq.euclidian", method = "ward.D", seed = 1234,
      nr_clus = 3, data_filter = "")
plot(kcluster1)
str(data)

result <- kclus(shopping, vars = "v1:v6", nr_clus = 3)
plot(result)

#city - 
head(city)
result <- mds(city, "from", "to", "distance")
plot(result, fontsz = 7)
plot(result, rev_dim = 1:2)


result <- conjoint(mp3, rvar = "Rating", evar = "Memory:Shape")
pr= predict(result, pred_data = mp3)
print(x=pr,n =5)

mp3


#PCA eval
head(shopping)
pre_factor(shopping, "v1:v6") %>% str()

prmap(computer, brand = "brand", attr = "high_end:business") %>% str()


radiant.multivariate()
