## These functions are to make a matrix and to return the inverse of a matrix
#  We cache the inverse if inverse has already been caculated

makeCacheMatrix <- function(x = matrix()) {
  # sets the values to NULL
  inverse <- NULL 
  y <- NULL 
  
  #sets the matrix
  setmatrix <- function(y) { 
    x <<- y # Actual Matrix
    inverse <<- NULL # inverse
  }
  
  #gets the matrix
  getmatrix <- function() 
    x 
  
  # Solves the inverse
  setinverse <- function(solve) 
    inverse <<- solve  
  
  #Gets the inverse
  getinverse <- function() 
    inverse
  
  # list of the four functions
  list(setmatrix = setmatrix, getmatrix = getmatrix, 
       setinverse = setinverse,
       getinverse = getinverse)
}

cacheSolve <- function (x=matrix(), ...) {
  # Comparison of prior
  inverse <- x$getinverse() 
  
  #Check to see if value is set
  if(!is.null(inverse)){ 
    # Check to see if matrix has changed
    if(x$setmatrix() == x$getmatrix()) { 
      message("getting cached data")
      inverse <- x$getinverse()
    }
    # We return the inverse
    return(inverse)
  }
  
  # if not returned we do the following:
  #Get value of input matrix
  y <- x$getmatrix() 
  x$setmatrix(y) 
  inverse <- solve(y, ...) 
  # Sets the inverse
  x$setinverse(m)
  # returns inverse
  inverse 
}

#Test code
##matrixTest <- matrix(data = c(1,-.25,-.25, 1), nrow = 2, ncol = 2)
##NewCachedMatrix <- makeCacheMatrix(matrixTest)
##cacheSolve(NewCachedMatrix)

