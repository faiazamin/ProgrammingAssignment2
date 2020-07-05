## Put comments here that give an overall description of what your
## functions do


##makeCacheMatrix calculates the matrix same as the function calculates vector. Basically it returns a list of funtions and those are
##* a function  that set the value of the matrix
##* a function  that get the value of the matrix
##* a function  that set the value of the inverse
##* a function  that get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## cacheSolve function takes an special matrix crted with the above function
## as argument. It first check whether the inverse is saved in cache. If so 
## it returns the saved inverse otherwise it calculates the inverse and saves
## in cache and returns it.

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- sole(data, ...)
  x$setinverse(i)
  i
        ## Return a matrix that is the inverse of 'x'
}
