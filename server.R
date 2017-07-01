library(shiny)
library(readr)
library(dplyr)
library(magrittr)
library(ggplot2)

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

#make new columns of NA so all dfs have same columns
w6_1965veg$ElevB <- rep(NA, nrow(w6_1965veg))
w6_1977veg$ElevB <- rep(NA, nrow(w6_1977veg))
w6_1982veg$ElevB <- rep(NA, nrow(w6_1982veg))
w6_1987veg$ElevB <- rep(NA, nrow(w6_1987veg))
w6_1992veg$ElevB <- rep(NA, nrow(w6_1992veg))
w6_1997veg$ElevB <- rep(NA, nrow(w6_1997veg))

w6_1965veg$AnalysisCode <- rep(NA, nrow(w6_1965veg))
w6_1977veg$AnalysisCode <- rep(NA, nrow(w6_1977veg))
w6_1982veg$AnalysisCode <- rep(NA, nrow(w6_1982veg))
w6_1987veg$AnalysisCode <- rep(NA, nrow(w6_1987veg))
w6_1992veg$AnalysisCode <- rep(NA, nrow(w6_1992veg))
w6_1997veg$AnalysisCode <- rep(NA, nrow(w6_1997veg))

w6_1965veg$bbd <- rep(NA, nrow(w6_1965veg))
w6_1977veg$bbd <- rep(NA, nrow(w6_1977veg))
w6_1982veg$bbd <- rep(NA, nrow(w6_1982veg))
w6_1987veg$bbd <- rep(NA, nrow(w6_1987veg))
w6_1992veg$bbd <- rep(NA, nrow(w6_1992veg))
w6_1997veg$bbd <- rep(NA, nrow(w6_1997veg))
w6_2002veg$bbd <- rep(NA, nrow(w6_2002veg))
w6_2007veg$bbd <- rep(NA, nrow(w6_2007veg))

#make new col of year
w6_1965veg$year <- rep(1965, nrow(w6_1965veg))
w6_1977veg$year <- rep(1977, nrow(w6_1977veg))
w6_1982veg$year <- rep(1982, nrow(w6_1982veg))
w6_1987veg$year <- rep(1987, nrow(w6_1987veg))
w6_1992veg$year <- rep(1992, nrow(w6_1992veg))
w6_1997veg$year <- rep(1997, nrow(w6_1997veg))
w6_2002veg$year <- rep(2002, nrow(w6_2002veg))
w6_2007veg$year <- rep(2007, nrow(w6_2007veg))
w6_2012veg$year <- rep(2012, nrow(w6_2012veg))

#combine dfs into one
w6_veg <- rbind(w6_1965veg, w6_1977veg, w6_1982veg, w6_1987veg, w6_1992veg, w6_1997veg, w6_2002veg, w6_2007veg, w6_2012veg)

#filter by sugar maples
w6_veg <- w6_veg[w6_veg$Species == "ACSA", ]

#sum by year in new column.. ##WEIGHT THIS
w6_veg_yearly_biomass <- w6_veg %>% 
  group_by(year) %>% 
  summarise(AbvBmss_year_sum = sum(AbvBmss))

#save as RDS file
saveRDS(w6_veg, file="w6_veg.rds")
w6_veg <- readRDS("w6_veg.rds")

################## END DATA IMPORT ##################

shinyServer(function(input, output){

  #make some type of output to show change in tree biomass over time
  output$sugar_maple_change <- renderPlot({
    ggplot(w6_veg, aes(year, AbvBmss, size = BlwBmss))+
      geom_point()
  })
  
})