
############## Caching the inverse of a matrix ################

# Function 1: creates a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()){
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  
  setInverse <- function(solve) m <<- solve
  getInverse <- function() m
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

# Function 2: computes the inverse of the matrix object returned by 
# the makeCacheMatrix function above. If the inverse has already been
# calculated (and the matrix has not changed), then the cacheSolve function
# retrieves the inverse from the cache

cacheSolve <- function(x,...){
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached inverse matrix")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}