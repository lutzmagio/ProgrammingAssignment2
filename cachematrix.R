## ----------------------------------------------------------------
## Caching inverse of matrix
## ----------------------------------------------------------------

## Put comments here that give an overall description of what your
## functions do

# This set of functions is used to cache the inverse of a matrix
#   in order to save computing time when repeatedly the inverse
#   of the same matrix is required.

# ---- makeCacheMatrix ----

## Write a short comment describing this function

# Make a matrix that is a special object including ability to
#   - set the value of the matrix
#   - get the value of the matrix
#   - set the inverse of the matrix
#   - get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    # Initialization
    inv <- NULL # inv will store the inverse internally (cache)
    
    # set values of the matrix
    #   this function is intendet to be called from outside
    set <- function(y) {
        x <<- y
        # set inv to NULL again because if set is called again later
        #   the inverse shall be indicated as invalid
        inv <<- NULL
    }
    # get values of the matrix
    get <- function() x
    
    # set inverse of the matrix
    #   not calculated here but given as argument!
    setinv <- function(inverse) inv <<- inverse
    
    # get inverse of the matrix
    #   which was previously stored
    #   or NA at initialization
    getinv <- function() inv
    
    # assign the functions to the list returned in the myInv <- makeCacheMatrix
    #   constructor call in order to call them like myInv$get() from anywhere
    #   in the program
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

# ---- cacheSolve ----

## Write a short comment describing this function

# cacheSolve is used as a utility to get the inverse of a matrix.
#   It will either re-calculate or retrieve the cached inverse of a matrix

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    # x must of of the object type described in function "makeCacheMatrix"
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv) # return cached inverse and quit function
    }
    # if inv == null we can reach this new-calculation of inv
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}


