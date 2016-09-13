## 
# Problem 22
# ------------------
# Using names.txt (right click and 'Save Link/Target As...'), 
# a 46K text file containing over five-thousand first names, 
# begin by sorting it into alphabetical order. 
# Then working out the alphabetical value for each name, 
# multiply this value by its alphabetical position in the 
# list to obtain a name score.
# 
# For example, when the list is sorted into alphabetical order, 
# COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th 
# name in the list. 
# So, COLIN would obtain a score of 938 × 53 = 49714. What 
# is the total of all the name scores in the file?
##

if(!('readr' %in% installed.packages()))
   install.packages('readr')

library(readr)

url <- "https://projecteuler.net/project/resources/p022_names.txt"

if(!file.exists(basename(url)))
    download.file(url, basename(url))

names <- read_csv(basename(url), col_names = FALSE, trim_ws = TRUE)
names <- sort(unlist(as.list(names)))
total <- 0

for(i in 1:length(names)) {
    total <- total + sum(sapply(unlist(strsplit(names[i], split = "")), function(x) which(x == LETTERS))) * i
}

total