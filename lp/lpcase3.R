#LP
#https://analyticsdefined.com/linear-optimization-problem-using-r/

## Load the package lpsolve
library(lpSolve)

## Set the coefficients of the decision variables
objective.in  <- c(25,  20)

## Create constraint martix
const.mat <- matrix(c(20,  12,  4,  4),  nrow=2, byrow=TRUE)
const.mat
## define constraints
time_constraint <- (8*60)
resource_constraint <- 1800

## RHS for the constraints
const.rhs <- c(resource_constraint, time_constraint)

## Constraints direction
const.dir  <- c("<=",  "<=")

## Find the optimal solution
optimum <-  lp(direction="max",  objective.in, const.mat, const.dir,  const.rhs)

## Display the optimum values for x1 and x2
optimum$solution

## [1] 45 75

## Check the value of objective function at optimal point
optimum$objval

## [1] 2625

#From the above output, we can see that the company should produce 45 units of Product A and 75 units of Product B to get sales of $2625.