## These two function(makeCacheMatrix / casheSolve) will make a special 'matrix'
## ,then it will cache them so that to use less computer resource to calculate the result.
## Afterall, the result of the function, is "the inverse of original matrix",  
## and that is computed by cached data.

makeCacheMatrix <- function(x = matrix()) {
## This function creates a special "matrix" object that can cache its inverse.
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
  }
cacheSolve <- function(x, ...) {
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix. 
## If the inverse has been calculated (and the matrix has not changed),
## then the cachesolve retrieves the inverse from the cache.
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}