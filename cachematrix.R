## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than compute it repeatedly.


# This function creates a special "matrix" object that can cache its inverse.
makeMatrix <- function(x = matrix()) {
  inv <<- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function()x
  setinverse <- function(inverse)inv <<- inverse
  getinverse <- function()inv
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = setinverse)
}



# The following function calculates the inverse of the special "matrix" created with the above function
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  matrix <- x$get
  inv <- solve(matrix,...)
  x$setinverse(inv)
  inv
}
