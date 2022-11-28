################################################################################
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, #
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.                 #
#                                                                              #
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out  #
# in words, how many letters would be used?                                    #
#                                                                              #
# NOTE: Do not count spaces or hyphens. For example, 342                       #
# (three hundred and forty-two) contains 23 letters and 115                    #
# (one hundred and fifteen) contains 20 letters. The use of "and" when writing #
# out numbers is in compliance with British usage.                             #
################################################################################    
library(dplyr)
library(stringi)

numbers_list = c(
  '0' = '',
  '1' = 'one',
  '2' = 'two',
  '3' = 'three',
  '4' = 'four', 
  '5' = 'five', 
  '6' = 'six', 
  '7' = 'seven', 
  '8' = 'eight', 
  '9' = 'nine',
  '10' = 'ten',
  '20' = 'twenty',
  '30' = 'thirty',
  '40' = 'forty',
  '50' = 'fifty',
  '60' = 'sixty',
  '70' = 'seventy',
  '80' = 'eighty',
  '90' = 'ninety',
  '100' = 'hundred',
  '1000' = 'thousand',
  '1000000' = 'million',
  '1000000000' = 'billion')

# number_to_string <- function(number) { 
#   lapply(1:nchar(number), function(x) {
#     case_when(
#       x == 4 ~ 
#         paste0(numbers_list[substr(number, x,x)], 'thousand'),
#       x == 3 && strtoi(substr(number, x,x)) == 0 ~ 
#         paste0(numbers_list[substr(number, x,x)], 'hundred'),
#       x == 2 ~ 
#         numbers_list[as.character(strtoi(substr(number, x,x)) * 10)],
#       x == 1 ~ 
#         numbers_list[substr(number, x,x)],
#       TRUE ~ '')}) %>% 
#     paste(collapse = '')
# }

number_to_string <- function(number) { 
  result <- ''
  number_length <- nchar(number)
  
  case_when(
    number_length == 3 ~ result <- paste0(result, 'thousand'),
    number_length == 2 ~ result <- paste0(result, 'hundred'),
    TRUE ~ result <- result.join('')
  )
  
  lapply(number, function(num) { 
    case_when(
      number_length == 2 && substr(number, 2,2) == '0' ~ 
        result <- paste0(result, numbers_list[
          as.character(strtoi(substr(number,1,1)) * 10)]),
      
      number_length == 3 && substr(number, 2,3) == '00' ~ 
        result <- paste0(result, numbers_list[
          as.character(strtoi(substr(number,1,1)) * 100)])
    )}
  )}
  
# lapply(1:nchar(number), function(x) {
#   case_when(
#     x == 4 ~
#       paste0(numbers_list[substr(number, x,x)], 'thousand'),
#     x == 3 && strtoi(substr(number, x,x)) == 0 ~
#       paste0(numbers_list[substr(number, x,x)], 'hundred'),
#     x == 2 ~
#       numbers_list[as.character(strtoi(substr(number, x,x)) * 10)],
#     x == 1 ~
#       numbers_list[substr(number, x,x)],
#     TRUE ~ '')}) %>%
#   paste(collapse = '')

n_list <- 123 %>% as.character %>% stri_reverse

lapply(n_list, number_to_string) %>% paste(collapse = '') %>% nchar
