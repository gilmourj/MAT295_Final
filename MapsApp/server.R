#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(maps)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  yearreact <- reactive(
    filter(currentData, currentData$year == (input$Year)))
  
  output$Map <- renderPlot({
    ggplot() +
      geom_polygon(data = yearreact(), 
                   aes(x = long, y = lat, group = group, fill = fertility), 
                   color = "black") + 
      scale_fill_continuous(name="Fertility",limits = c(0,10),
                            breaks=c(2,4,6,8), 
                            low = "green", high = "red")
    
  })
})
