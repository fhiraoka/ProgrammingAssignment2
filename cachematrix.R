## makeCacheMatrix and cacheSolve are a pair of functions that possibly speedups the 
## computation of inverse matrix by caching the previouslly computed inverse matrices.  

## makeCacheMatrix instantiates and caches an object which holds a matrix and its inverse.
makeCacheMatrix <- function(x = matrix()) {

    x_inverse <- NULL
    
    set <- function(y) {
        x <<- y
        x_inverse <<- NULL
    }
    
    get <- function() x

    setInverse <- function(z) x_inverse <<- z

    getInverse <- function() x_inverse
    
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## cacheSolve computes the inverse of a matrix. If the inverse is previously computed, 
## it returns the inverse from the cache. 
cacheSolve <- function(x, ...) {

    x_inverse <- x$getInverse()
    
    if(!is.null(x_inverse)) {
        message("getting cached data")
        return(x_inverse)
    }
    
    x_inverse <- solve(x$get(), ...)
    x$setInverse(x_inverse)

    ## Return a matrix that is the inverse of 'x' 
    x_inverse
}
