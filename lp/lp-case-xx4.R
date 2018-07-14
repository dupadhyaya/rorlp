#http://lpsolve.sourceforge.net/5.5/R.htm

library(lpSolveAPI)
#Consider the following example. First we create an empty model x.

x <- make.lp(2, 2)
x
#Then we assign x to y.
y <- x
#Next we set some columns in x.
set.column(x, 1, c(1, 2))
x
set.column(x, 2, c(3, 4))
x
#And finally, take a look at y.
y
#The changes we made in x appear in y as well. Although x and y are two distinct objects in R, they both refer to the same lp_solve 'lprec' structure.


lprec <- make.lp(0, 4)
lprec

set.objfn(lprec, c(1, 3, 6.24, 0.1))
lprec
add.constraint(lprec, c(0, 78.26, 0, 2.9), ">=", 92.3)
lprec
add.constraint(lprec, c(0.24, 0, 11.31, 0), "<=", 14.8)
lprec
add.constraint(lprec, c(12.68, 0, 0.08, 0.9), ">=", 4)
lprec
set.bounds(lprec, lower = c(28.6, 18), columns = c(1, 4))
lprec
set.bounds(lprec, upper = 48.98, columns = 4)
lprec
RowNames <- c("THISROW", "THATROW", "LASTROW")
ColNames <- c("COLONE", "COLTWO", "COLTHREE", "COLFOUR")
dimnames(lprec) <- list(RowNames, ColNames)

#Lets take a look at what we have done so far.
lprec  # or equivalently print(lprec)
print(lprec)

solve(lprec)

get.objective(lprec)

get.variables(lprec)

get.constraints(lprec)

status <- add.constraint(lprec, c(12.68, 0, 0.08, 0.9), ">=", 4)
status
