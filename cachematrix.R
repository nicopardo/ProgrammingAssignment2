## cache inverse of a matrix and call the cached value

## these functions stores the inverse of a matrix in cache 

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function (y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() {x}
        setinverse <- function(solve) {inv <<- solve}
        getinverse <- function() {inv}
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## this function calls the inverse of the matrix stored in cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv
}


# test <- matrix(c(1:4), nrow = 2, ncol = 2)
# inverse <- solve(test)
# inverse
# 
# makeCacheMatrix.object <- makeCacheMatrix(test)
# makeCacheMatrix.object$set
# makeCacheMatrix.object$get
# makeCacheMatrix.object$setinverse
# makeCacheMatrix.object$getinverse
# 
# cacheSolve(makeCacheMatrix.object)

