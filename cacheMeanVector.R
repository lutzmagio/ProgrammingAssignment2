## ----------------------------------------------------------------
## Caching mean of a vector
## ----------------------------------------------------------------

# Example from programming assignment task description

# copied from coursera.org course R Programming

## ---- makeVector -----

# Make a vector that is a special object including ability to
#   - set the value of the vector
#   - get the value of the vector
#   - set the mean value of the vector
#   - get the mean value of the vector

makeVector <- function(x = numeric()) {
    # Initialization
    m <- NULL # m will store the mean internally (cache)
    
    # set values of the vector
    #   this function is intendet to be 
    set <- function(y) {
        x <<- y
        # set m to NULL again because if set is called again later
        #   the mean shall be indicated as invalid
        m <<- NULL
    }
    # get values of the vector
    get <- function() x
    
    # set mean of the vector
    #   not calculated here but given as argument!
    setmean <- function(mean) m <<- mean
    
    # get mean of the vector
    #   which was previously stored
    #   or NA at initialization
    getmean <- function() m
    
    # assign the functions to the list returned in the myVec <- makeVector
    #   constructor call in order to call them like myVec$get() from anywhere
    #   in the program
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}


## ---- cachemean ----

cachemean <- function(x, ...) {
    # x must of of the object type described in function "makeVector"
    m <- x$getmean()
    if(!is.null(m)) {
        message("getting cached data")
        return(m) # return cached mean and quit function
    }
    # if m == null we can reach this new-calculation of m
    data <- x$get()
    m <- mean(data, ...)
    x$setmean(m)
    m 
}


## ---- How the funcitons are used ----

# create special vector
#   mean will be 5
my_x1 <- makeVector(c(0,10))

# get mean
cachemean(my_x1)

# manipulate my_x1
my_x1$set(c(0,6))

# print new values of my_x1
my_x1$get()

# see what cachemean(my_x1) does now
cachemean(my_x1)
# ---> new mean is calculated correctly