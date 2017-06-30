library(shiny)
library(readr)

################## DATA IMPORT ##################

w6_1965veg <- read_csv("D:/Duke/Work(Environ)/Programming/sugar_maple_longterm_growth/w6_1965veg.txt")
w6_1977veg <- read_csv("D:/Duke/Work(Environ)/Programming/sugar_maple_longterm_growth/w6_1977veg.txt")
w6_1982veg <- read_csv("D:/Duke/Work(Environ)/Programming/sugar_maple_longterm_growth/w6_1982veg.txt")
w6_1987veg <- read_csv("D:/Duke/Work(Environ)/Programming/sugar_maple_longterm_growth/w6_1987veg.txt")
w6_1992veg <- read_csv("D:/Duke/Work(Environ)/Programming/sugar_maple_longterm_growth/w6_1992veg.txt")
w6_1997veg <- read_csv("D:/Duke/Work(Environ)/Programming/sugar_maple_longterm_growth/w6_1997veg.txt")
w6_2002veg <- read_csv("D:/Duke/Work(Environ)/Programming/sugar_maple_longterm_growth/w6_2002veg.txt")
w6_2007veg <- read_csv("D:/Duke/Work(Environ)/Programming/sugar_maple_longterm_growth/w62007veg.txt")
w6_2012veg <- read_csv("D:/Duke/Work(Environ)/Programming/sugar_maple_longterm_growth/w62012veg.txt")

################## END DATA IMPORT ##################


shinyServer(function(input, output){
  
})