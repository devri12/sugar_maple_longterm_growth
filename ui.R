library(shiny)
library(readr)
library(dplyr)
library(magrittr)
library(ggplot2)

shinyUI(fluidPage(
  plotOutput("sugar_maple_change")
))