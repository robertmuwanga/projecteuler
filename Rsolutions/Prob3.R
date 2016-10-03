### 
# Problem 3
# -------------------
#
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?
#
###

check.packages <- function() {
    if(!('gmp' %in% installed.packages())) install.packages('gmp')
    
    require('gmp')
}

ans <- function(x) {
    if(!check.packages()) stop("gmp package cannot be installed / loaded.")
    
    tail(factorize(x), 1)
}