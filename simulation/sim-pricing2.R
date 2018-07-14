#Monte Carlo Sim
#https://www.youtube.com/watch?v=HOW5ul9WUhE&t=28s
library(triangle)

options(scipen = 999)
start.time<-Sys.time() ## start stopwatch
mydata<-lapply(1:1000, function(i) { 
  ## Net Profit = Sales Volume * (Selling Price - Unit cost) - Fixed costs
   ## create random uniform integer for SalesVolume
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
  ## create triangular distribution for unit cost (as per example)
  Unitcost = rtriangle(1,5.5,7.5,c = 6.5) ## c=mode of distribution
  #### hist(rtriangle(10000000,5.5,7.5))
  Fixedcosts = 120000
  NetProfit = SalesVolume * (SellingPrice - Unitcost) - Fixedcosts
})

stop.time<-Sys.time() ## stop stopwatch
time.taken.lapply = stop.time-start.time
LApply_NetProfits = unlist(mydata)
hist(LApply_NetProfits)
mean(LApply_NetProfits)
summary(LApply_NetProfits)


### using for loop

start.time.fl<-Sys.time() ## start stopwatch
NetProfits=vector(mode="numeric")   ## mind the "s"
SalesVolumes = vector(mode="numeric")  
UnitCosts = vector(mode="numeric")  
SellingPrices = vector(mode="numeric")  



## Net Profit = Sales Volume * (Selling Price - Unit cost) - Fixed costs## create random uniform integer for SalesVolume
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
  ## create triangular distribution for unit cost (as per example)
  #library(triangle)
  Unitcost = rtriangle(1,5.5,7.5,c = 6.5) ## c=mode of distribution
  #### hist(rtriangle(10000000,5.5,7.5))
  Fixedcosts = 120000
  NetProfit = SalesVolume * (SellingPrice - Unitcost) - Fixedcosts
  NetProfits[i]=NetProfit
  SalesVolumes[i] = SalesVolume  
  UnitCosts[i] = Unitcost  
  SellingPrices[i] = SellingPrice 
  }

stop.time.fl<-Sys.time() ## start stopwatch
time.taken.fl <-stop.time.fl - start.time.fl

time.taken.fl
time.taken.lapply
time.taken.fl - time.taken.lapply
par(mfrow = c(2,2))
hist(SalesVolumes)
hist(SellingPrices)
hist(UnitCosts)
hist(NetProfits)
abline(v=mean(NetProfits), col=2)

summary(SalesVolumes)
summary(SellingPrices)
summary(UnitCosts)
summary(NetProfits)


par(mfrow = c(1,1))

