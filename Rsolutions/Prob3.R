### 
# Problem 3
# -------------------
#
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?
#
###

ans <- function(x) {
  if(x == 1)
  {
    x
  }
  else {
    max(x[1], ans(sapply(x[-1], function(y) { if(y %% x[1] == 0) y / x[1] else y})))
  }
}
