## ----------------------------------------------------------------
## Test caching inverse of matrix
## ----------------------------------------------------------------

# This script contains some calls to test "cachematrix.R"

# load functions
source("cachematrix.R")

# Create the "special matrix object"
myMat <- cbind(c(-1, 1), c(3/2, -1))
myMat
myInv <- makeCacheMatrix(myMat)
myInv$get()

# get inverse
cacheSolve(myInv)

# get inverse once again
cacheSolve(myInv)

# now change the matrix
myMat <- cbind(c(-1, 1), c(7/2, -1))
myInv$set(myMat)

# get inverse (cache is marked NULL so recalculation will take place)
cacheSolve(myInv)