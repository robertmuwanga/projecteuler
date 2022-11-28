# Let d(n) be defined as the sum of proper divisors of n (numbers less than n 
# which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and 
# each of a and b are called amicable numbers.
# 
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 
# 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 
# 71 and 142; so d(284) = 220.
# 
# Evaluate the sum of all the amicable numbers under 10000.

library(dplyr)
library(purrr)
library(furrr)

factorise <- function(number) {
  f <- map_dbl(seq.int(1, number), function(x) {
    if_else(number %% x == 0, number / x, 0)
  }) %>% .[. > 0] %>% sort
  f <- if_else(length(f) > 1, f[])
}



range <- 1:100

f <- tibble(x = range)
f$y <- sapply(f$x, function(x) factorise(x) %>% sum)
