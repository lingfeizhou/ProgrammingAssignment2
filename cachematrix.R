## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## The function "makeCacheMatrix" created a special "matrix" object that can cache its inverse. It's a list containing a function to: 
## 1. Set the value of the matrix
## 2. Get the value of the matrix
## 3. Set the value of the inverse of the matrix
## 4. Get the value of the inverse of the matrix


makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
    	x <<- y
    	i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(
        set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse)
}


## Write a short comment describing this function

## The following function calculates the inverse value of the special matrix created with the above function. First, it will check to see if the inverse value has already been calculated. If so, it gets the inverse from the cache and skips the computation. Otherwise, it calculates the inverse of the matrix and sets the value of the inverse in the Cache via the setinverse function. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i))  {
        	message("getting cached data")
        	return(i)
        }
        data <- x$get()
        i <- solve(data,...)
        x$setinverse(i)
        i
}
