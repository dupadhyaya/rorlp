#Perceptual Maps
#https://protobi.com/post/a-new-take-on-perceptual-maps

#install.packages("psych")
library("psych")
df <- read.csv(url("http://protobi.com/examples/pca/brand.csv"),
               header=TRUE, row.names=1)
df
pc.cr <- princomp(df, cor=TRUE)
pc.cr

summary(pc.cr)
biplot(pc.cr)
