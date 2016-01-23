## This 2 functions are used for saving data of inverse matrix

## this is used to build a struture of some subsets function which may be used in the next function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsol <- function(solve) m <<- solve
  getsol <- function() m
  list( set = set, get = get, setsol = setsol , getsol = getsol)
}


## Write a short comment describing this function
cacheSolve <- function(x, ...) {
  m <- x$getsol()
  if(!is.null(m)){##check if the data has compute
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  ## this x is not the matrix but the last function
  m <- solve(data, ...)
  x$setsol(m) ## mark as solved
  m
  ## Return a matrix that is the inverse of 'x'
}
