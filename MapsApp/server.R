library(shiny)
library(ggplot2)
library(maps)

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
                            low = "green", high = "purple")
  })
})
