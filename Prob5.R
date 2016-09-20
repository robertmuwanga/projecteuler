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

ans <- function(n) {
    if(length(n) == 1) n
    
    else {
        h <- head(n , 1)
        h * ans(as.integer(
                sapply(tail(n, -1), function(x) {
                    if(x %% h == 0) x / h
                    else x
        })))
    }
}

ans(1:20)