# Goal Programming - Built in Data Set
#https://cran.r-project.org/web/packages/goalprog/goalprog.pdf

library(goalprog)
achievements
data( ignizio.example.3.1 )
soln <- llgp( coefficients, targets, achievements )
soln


data( ignizio.example.3.3 )
soln <- llgp( coefficients, targets, achievements )
soln


#-----
###
### ignizio.example.3.5
###
### The data in this file define the coefficients, target values and achievements
### for Example 3-5 in Ignizio (1976) Goal Programming and Extensions.
###
coefficients <- matrix( 
  c( 8, 12,
     1, 2, 
     1, 0, 
     0, 1 ), 
  nrow=4, byrow=TRUE )
coefficients
targets <- c( 1000, 40, 30, 15 )
achievements <- data.frame( matrix( 
  c( 3, 1, 1.0, 0.0, 
     4, 1, 1.0, 0.0, 
     1, 2, 0.0, 1.0, 
     2, 3, 1.0, 0.0, 
     3, 4, 0.0, 1.0, 
     4, 4, 0.0, 1.5),
  nrow=6, byrow=TRUE ) )
names( achievements ) <- c( "objective", "priority", "p", "n" )
achievements

soln <- llgp( coefficients, targets, achievements )
soln
