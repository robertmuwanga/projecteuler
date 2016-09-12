x <- 1:20
n <- 1

for(elem in x) {
    n <- c(n, elem)
    x <<- x %/% elem
}
