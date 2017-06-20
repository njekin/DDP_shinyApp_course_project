# shiny app for Coursera Developing Data Product course project
# Jun Wang
# 6/20/2017

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Daily air quality measurements in New York, May to September 1973"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      #h2 <- "Choose which variable to explore",
      radioButtons("typeInput", 
                   "Influencing Factor",
                   choices = c("Solar.R", "Wind", "Temp"),
                   selected = "Temp"),
      #h3 <- "Select month of data",
      sliderInput("month",
                   "Select Month:",
                   min = 5,
                   max = 9,
                   step = 1,
                   value = c(5,9)),
      
      #submitButton("Go")
      
      h2 <- "Instruction:     
      This Shiny app allows you to visualize the relationship between
      Ozone content and influencing factors including Solar Radiation, Wind speed, and temeprature. 
      The app also allows you to select specific month or several months together.
      The chosen data used in plotting is provided as a table.
      The visualization is provided as interactive plotly scatterplot. Linear model is also displayed. 
      Modelling summary is printed as well."
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotlyOutput("Plot1"),
       verbatimTextOutput("type"),
       tableOutput("table")
    )
  )
))
