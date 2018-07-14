
#profit = sales *( Selling Price - Cost) - Fixed cost
options(scipen=999)
library(triangle)

NetProfits = vector(mode='numeric')
SalesVolumes = vector(mode='numeric')
UnitCosts = vector(mode='numeric')
SellingPrices = vector(mode='numeric')
FixedCosts = 120000

# par(mfrow=c(1,1))
# DU = sample(x=1:3, size=1, replace=T)
# hist(sample(x=1:3, size=1000000, replace=T))


#One Loop # For DU==1
# SalesVolume=100000
# SellingPrice = 8
# (unitcost = rtriangle(1, 5.5, 7.5))
# (NetProfit = SalesVolume * (SellingPrice - unitcost) - FixedCosts)
# (SalesVolumes = SalesVolume)
# (SellingPrices = SellingPrice)
# (UnitCost = unitcost)
# (NetProfits = NetProfit)
# summary(SalesVolumes)
# summary(SellingPrices)
# summary(NetProfits)
# SalesVolumes[1] = SalesVolume
# SellingPrices[1] = SellingPrice
# UnitCosts[1] = unitcost
# NetProfits[1]= NetProfit

#run simulation 10000 times and note time
start.time = Sys.time()
for(i in 1:10000) { 
  DU = sample(x=1:3,size = 1,replace = T)
  if(DU==1){
    SalesVolume=100000
    SellingPrice=8
  }
  if(DU==2){
    SalesVolume=75000
    SellingPrice=10
  }
  if(DU==3){
    SalesVolume=50000
    SellingPrice=11
  }
  Unitcost = rtriangle(1,5.5,7.5,c = 6.5) ## c=mode of distr
  Fixedcosts = 120000
  NetProfit = SalesVolume * (SellingPrice - Unitcost) - Fixedcosts
  NetProfits[i]=NetProfit
  SalesVolumes[i] = SalesVolume  
  UnitCosts[i] = Unitcost  
  SellingPrices[i] = SellingPrice 
}
end.time = Sys.time()
(time.taken = end.time - start.time)

(NetProfits = unlist(mydata))
#summaries
summary(NetProfits)
par(mfrow=c(1,1)) # 1 x 1 frame
hist(NetProfits)
time.taken

par(mfrow=c(2,2))
SalesVolumes
summary(SalesVolumes)
abline(v=mean(SalesVolumes), col=2, lwd=3)

summary(SellingPrices)
abline(v=mean(SellingPrices), col=2, lwd=3)

summary(UnitCosts)
abline(v=mean(UnitCosts), col=2, lwd=3)

summary(NetProfits)
abline(v=mean(NetProfits), col=2, lwd=3)



# for and lapply
