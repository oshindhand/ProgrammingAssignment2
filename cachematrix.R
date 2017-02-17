<<<<<<< HEAD
## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
=======

############## Caching the inverse of a matrix ################

# Function 1: creates a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()){
  m <- NULL
  set <- function(y) {   #function to set the value of the matrix
    x <<- y   #caches the inputted matrix
    m <<- NULL   #resets the value of m
  }
  get <- function() x   #function to retrieve the input matrix
  
  setInverse <- function(solve) m <<- solve   #function to calculate the inverse matrix
  getInverse <- function() m   #function to retrieve the inverse matrix
  
  list(set = set, get = get,   # creates a list of 4 functions
       setInverse = setInverse,
       getInverse = getInverse)
}

# Function 2: computes the inverse of the matrix object returned by 
# the makeCacheMatrix function above. If the inverse has already been
# calculated (and the matrix has not changed), then the cacheSolve function
# retrieves the inverse from the cache

cacheSolve <- function(x,...){
  m <- x$getInverse()   #gets the inverse if it has already been calculated
  if(!is.null(m)) {
    message("getting cached inverse matrix")   #if it has not been calculated, a message is printed
    return(m)
  }
  data <- x$get()  #gets the value of the input matrix 
  m <- solve(data, ...)   #calculate the inverse of the input matrix
  x$setInverse(m)   #cache the inverse matrix
  m
}
>>>>>>> origin/master
