# shiny app for Coursera Developing Data Product course project
# Jun Wang
# 6/20/2017

library(shiny)
#library(GGally)
library(tidyverse)
library(plotly)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  # reactive function to filter dataset based on inputs
  dt <- reactive({
    airquality %>%
      dplyr::filter(Month %in% seq(input$month[1], input$month[2])) %>% 
      dplyr::select_("Ozone", input$typeInput, "Month", "Day")
  })
  # build linear model
  md <- reactive ({
    lm(Ozone~., data=dt()[1:2])
  })

  # generate output interactive plot
  output$Plot1 <- renderPlotly({

    g <- qplot(data = dt(), x = Ozone, y = get(names(dt())[2]),
          geom = c("point"),
          ylab = names(dt())[2],
          main = paste("Month", paste(seq(input$month[1], input$month[2]), collapse = " ")))
    
    g <- g + geom_smooth(method=lm) 

    g
  })
  
  # export linear model summary
  output$type <- renderPrint({
     summary(md())
  })
  
  # export filtered data table
  output$table <- renderTable({
    dt()
  })
  
})
