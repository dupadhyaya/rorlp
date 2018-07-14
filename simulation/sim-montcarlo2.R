#Simple Simulation

coin = c('Head','Tail')
set.seed(1)
y = sample(coin, 6, replace = T)
y
table(y)
length(y[y=='Tail'])


#Do it 100 times
replicate(n=5, 3)
replicate(n=5, c('H','T'))
replicate(n=5, sample(c('H','T')))

replicate(n=10, expr=sample(coin, 6, replace=T))  #list output matrix form
(y1=replicate(100, sample(coin, 6, replace=T)))
# 6 rows of H & T, 100 columns
table(y1)
prop.table(table(y1))

#for each columns how many times Head has occurred
length(sample(coin, 6, replace=T))
#find length of Heads for each column
a = replicate(100, length(sample(coin, 6, replace=T)[y=='Head']))
a  # 3 across all columns - unbaised estimate
mean(a)
