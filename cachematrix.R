## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x=matrix()) {  ##Define the argument with default as matrix
  inv<- NULL                               ##Initializing inv as NULL, which will hold the inverse value
  set <- function(y){                      ##define the set function to assign new value of matrix in the parent environment
    x <<- y
    inv <<- NULL                           ##if there is a new matrix reset inv to NULL
  }
  get <- function() x                      ## Return value of the matrix argument
  setinverse <- function(inverse) inv<- inverse ##assigns value of inv in parent environment
  getinverse <- function() inv             ##gets the value of inv where called
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  }



## Write a short comment describing this function
##This Function calculates the inverse of special matrix which is returned by the above 
##function makeCacheMatrix. If the inverse is already calculated the inverse is 
##retrieved from the cache.

cacheSolve <- function(x,...){
  inv<- x$getinverse()
  if(!is.null(inv)){
    message("Getting Cached Matrix")
    return(m)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
