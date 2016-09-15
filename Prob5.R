### 
# Problem 5
# -------------------
#
# 2520 is the smallest number that can be divided by each of the 
# numbers from 1 to 10 without any remainder.
# 
# What is the smallest positive number that is evenly divisible
# by all of the numbers from 1 to 20?
###

rj <- function() {
    x <- 1:20
    
    getrange <- function() x
    
    updateRange <- function(startIndex, n) {
        x <- c(x[1:startIndex-1], x[startIndex:length(x)])
    }
}