

server <- function(input, output) {
  
  xvar <- reactive({
    switch(input$X,
           "Fertility" = {region$Fertility},
           "Mortality" = {region$Mortality},
           "Life Expectancy" = {region$Life},
           "Agricultural Land" = {region$Agriculturalland},
           "Income" = {region$Income},
           "Urban Population" = {region$Urban},
           "Food Consumption" = {region$Food},
           "Year" = {region$year})
  })
  
  yvar <- reactive({
    switch(input$Y,
           "Fertility" = {region$Fertility},
           "Mortality" = {region$Mortality},
           "Life Expectancy" = {region$Life},
           "Agricultural Land" = {region$Agriculturalland},
           "Income" = {region$Income},
           "Urban Population" = {region$Urban},
           "Food Consumption" = {region$Food},
           "Year" = {region$year})
  })
  
  
  output$scatplot <- renderPlot({
    
    ggplot(region, aes(x = xvar(), y = yvar(), color = region)) + geom_point() +
      labs(x = input$X, y = input$Y , color = "Region") + scale_color_manual(values = c("#63B2AA","#CC1818", "#EF7C09", "#4ABA57", "#575B8E", "#DE89ED","#ED5E7D"))
  
    
  })
  
  output$scatplot1 <- renderPlot({
    
    regionfertility <- finaldata[finaldata$region == input$Region,]
    
    ggplot(regionfertility, aes(x = regionfertility$year, y = regionfertility$fertility, color = regionfertility$country)) + geom_point() +
      labs(x = "Year", y = "Fertility" , color = "Country") 
  })
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
  
}


