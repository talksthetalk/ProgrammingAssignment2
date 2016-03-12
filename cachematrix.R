## These functions take a square invertible matrix as input and return the inverse as output
## The makeCacheMatrix function takes a square invertible matrix as input
##    and generates a list of three functions (get, setsolve, and getsolve)

makeCacheMatrix <- function(x,a,b) {
  #initialize m
  m <- NULL
  #define functions and return list
  get <- function() matrix(x,a,b)
  setsolve <- function(aa) m <<- aa
  getsolve <- function() m
  list(get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

cachesolve <- function(y) {
  #test for cached
  bb <- y$getsolve()
  if(!is.null(bb)) {
    message("getting cached data")
    return(bb)
  }
  #generate inverse if not cached, and cache
  cc<-y$setsolve(solve(y$get()))
  cc
}
