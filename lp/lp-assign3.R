# lp Assign

#
# Set up problem: maximize
#   x1 + 9 x2 +   x3 subject to
#   x1 + 2 x2 + 3 x3  <= 9
# 3 x1 + 2 x2 + 2 x3 <= 15

#
f.obj <- c(1, 9, 3)   #x1 + 9 x2 +   x3
#   x1 + 2 x2 + 3 x3  <= 9
# 3 x1 + 2 x2 + 2 x3 <= 15

(f.con <- matrix (c(1, 2, 3, 3, 2, 2), nrow=2, byrow=TRUE))
(f.dir <- c("<=", "<="))
(f.rhs <- c(9, 15))

# Now run.
lp("max", f.obj, f.con, f.dir, f.rhs)
#Success: the objective function is 40.5

lp ("max", f.obj, f.con, f.dir, f.rhs)$solution
#[1] 0.0 4.5 0.0
#
# Run again, this time requiring that all three variables be integer
#
lp ("max", f.obj, f.con, f.dir, f.rhs, int.vec=1:3)
#Success: the objective function is 37
lp ("max", f.obj, f.con, f.dir, f.rhs, int.vec=1:3)$solution
#[1] 1 4 0

#lp.assign() example:----
  

(assign.costs <- matrix (c(2, 7, 7, 2, 7, 7, 3, 2, 7, 2, 8, 10, 1, 9, 8, 2), 4, 4))

lp.assign (assign.costs)
#Success: the objective function is 8
lp.assign (assign.costs)$solution

