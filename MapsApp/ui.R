#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  titlePanel("Fertility by Year"),
  
  # Sidebar with a slider input for number of bins
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("Year",
                  "Year:",
                  min = 1961,
                  max = 2007,
                  value = 1, sep = "")),
      
     # selectInput("CS",
       #           "Case Status:",
        #          c("Certified" = "Certified",
         #           "Withdrawn" = "Withdrawn",
          #          "Denied" = "Denied"))),
    
    # Show a plot of the generated distribution
    
    mainPanel(
      plotOutput("Map")
    )
  )
))
