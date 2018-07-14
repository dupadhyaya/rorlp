#LP - Marketing Spend

#http://mat.gsia.cmu.edu/classes/QUANT/NOTES/chap5.pdf

# lp Assign

# Set up problem: maximize
# min cost : 600x1 + 500x2 
f.obj <- c(600, 500)
#target
#    5x1  +  2x2  >= 24
#     x1  +  6x2  >= 18
#    3x1  +  3x2  >= 24
#     x1          >= 0
#             x2  >= 0
(f.con <- matrix (c(5, 2, 1, 6, 3, 3, 1,0,0,1), ncol=2, byrow=T))
(f.dir <- c(">=", ">=",">=",">=",">="))
(f.rhs <- c(24,18,24,0,0))
lprec
# Now run.
lp("min", f.obj, f.con, f.dir, f.rhs)
lp ("min", f.obj, f.con, f.dir, f.rhs)$solution

# Run again, this time requiring that all three variables be integer
lp ("min", f.obj, f.con, f.dir, f.rhs, int.vec=1:3)
lp ("min", f.obj, f.con, f.dir, f.rhs, int.vec=1:3)$solution

lp ("min", f.obj, f.con, f.dir, f.rhs, compute.sens = T)$sens.coef.from
lp ("min", f.obj, f.con, f.dir, f.rhs, compute.sens = T)$sens.coef.to
lp ("min", f.obj, f.con, f.dir, f.rhs, compute.sens = T)$duals
lp ("min", f.obj, f.con, f.dir, f.rhs, compute.sens = T)$duals.from
lp ("min", f.obj, f.con, f.dir, f.rhs, compute.sens = T)$duals.to
lp ("min", f.obj, f.con, f.dir, f.rhs, int.vec=1:3, compute.sens = T)$duals


#lp.assign() example:----

(lprec <- make.lp(nrow=0, ncol=2))
#nrow= constraints, ncol = decision variables
set.objfn(lprec, c(600, 500))
add.constraint(lprec, c(5, 2), ">=", 24)
lprec
add.constraint(lprec, c(1, 6), ">=", 18)
lprec
add.constraint(lprec, c(3, 3), ">=", 24)
lprec
#set.bounds(lprec, lower = c(28.6, 18), columns = c(1, 4))
#set.bounds(lprec, upper = 48.98, columns = 4)
RowNames <- c("Boys", "Women", "Men")
ColNames <- c("TV", "Mag")
dimnames(lprec) <- list(RowNames, ColNames)
lprec

solve(lprec)
get.objective(lprec)
get.variables(lprec)
get.constraints(lprec)
lprec

