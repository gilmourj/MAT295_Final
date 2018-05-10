library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Fertility by Year"),
  
  # Slider for year
  sidebarLayout(
    sidebarPanel(
      sliderInput("Year",
                  "Year:",
                  min = 1961,
                  max = 2007,
                  value = 1, sep = "")),
    
    mainPanel(
      plotOutput("Map")
    )
  )
))
