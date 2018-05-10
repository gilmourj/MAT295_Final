library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(titleWidth = 500,
                  title = "Fertility Trends"),
  dashboardSidebar(
    width = 300,
    sidebarMenu(
      menuItem("Variable Description", tabName = "var"),
      menuItem("Trends Grouped by Region", tabName = "region"),
      menuItem("Isolated Region Trends", tabName = "country"),
      menuItem("Map of Fertility", tabName = "map")
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem("var", 
              fluidRow(
                box(width = 12, status = "info",
                    title = "Description of the Different Variables",
                    tags$b("Fertility:"), "the number of children per woman",tags$br(),
                    "The number of children that would be born to each woman with prevailing age-specific fertility rates.",
                    tags$br(),tags$br(),
                    tags$b("Child Mortality:"), "expected number of children per 1,000 born that will die before age of five",tags$br(),
                    "The probability that a child born in a specific year will die before reaching the age of five if subject to current",
                    "age-specific mortality rates. Expressed as a rate per 1,000 live births.",
                    tags$br(),tags$br(),
                    tags$b("Life Expectancy:"), "life expectancy at birth in years",tags$br(),
                    "The average number of years a newborn child would live if current mortality patterns were to stay the same.",
                    tags$br(),tags$br(),
                    tags$b("Agricultural Land:"), "Percentage of land area used for agriculture",tags$br(),
                    "Agricultural land refers to the share of land area that is arable, under permanent crops, and under permanent pastures.",
                    "Arable land includes land defined by the Food and Agriculture Organization as land under temporary crops (double-cropped areas",
                    "are counted once) temporary meadows for mowing or for pasture, land under market or kitchen gardens, and land temporarily fallow. Land",
                    "abandoned as a result of shifting cultivation is excluded. Land under permanent crops is land cultivated with crops that",
                    "occupy the land for long periods and need not be replanted after each harvest, such as cocoa, coffee, and rubber. This",
                    "category includes land under flowering shrubs, fruit trees, nut trees, and vines, but excludes land under trees grown for",
                    "wood or timber. Permanent pasture is land used for five or more years for forage, including natural and cultivated crops.",
                    "Gapminder Source: Food and Agriculture Organization, electronic files and web site.",
                    tags$br(),tags$br(),
                    tags$b("Food Consumption:"), "The total supply of food available in a country, divided by the population and 365, the number of days in the year.",tags$br(),
                    "Kilocalories available, on average, for each person, each day. Calories measures the energy content of the food. The required intake",
                    "per day varies depending on several factors, e.g. activity level, weight, gender and age, but it is normally in the range of 1500-3000",
                    "kilocalories per day. One banana contains approximately 100 kilocalories.",
                    tags$br(),tags$br(),
                    tags$b("Income:"), "Gross Domestic Product per capita by Purchasing Power Parities (in international dollars, fixed 2011 prices).",tags$br(),
                    "The inflation and differences in the cost of living between countries has been taken into account.",
                    tags$br(),tags$br(),
                    tags$b("Urban Population:"), "Percentage of total population that lives in an Urban area",tags$br(),
                    "Urban population refers to people living in urban areas as defined by national statistical offices. It is calculated using World",
                    "Bank population estimates and urban ratios from the United Nations World Urbanization Prospects. Source: United Nations, World",
                    "Urbanization Prospects.",
                    tags$br(),tags$br(),
                    tags$em("All data and descriptions of variables were found within the datasets on Gapminder. https://www.gapminder.org/data/ "),
                    tags$em("Most of the datasets were limited in that they only provided data up through the year 2007. Another limitation was that some datasets"),
                    tags$em("did not have data for every country.")
                )
              )
      ),
      tabItem("region", 
              fluidRow(
                box(width = 3, status = "info",
                    title = "Regional Trends ",
                    selectInput(inputId = "X" ,
                                label = "X",
                                choices = c("Fertility",
                                            "Mortality",
                                            "Life Expectancy",
                                            "Agricultural Land",
                                            "Income",
                                            "Urban Population",
                                            "Year")),
                    selectInput(inputId = "Y" ,
                                label = "Y",
                                choices = c("Fertility",
                                            "Mortality",
                                            "Life Expectancy",
                                            "Agricultural Land",
                                            "Income",
                                            "Urban Population",
                                            "Year"))
                    
                ),
                box(width = 9, status = "info",
                    title = "Regional Trends ",
                    
                    plotOutput("scatplot")
                    
                )
                
              )
      ),
      tabItem("country", 
              fluidRow(
                box(width = 4, status = "info",
                    title = "Country Trends ",
                    selectInput(inputId = "Region" ,
                                label = "Region",
                                choices = c("South Asia", 
                                            "Europe & Central Asia",
                                            "Middle East & N. Africa", 
                                            "Sub-Saharan Africa",
                                            "Latin America",
                                            "East Asia & Pacific",
                                            "North America"))
                )
              ),
              box(width = 13, status = "info",
                  title = "Country Trends ",
                  
                  plotOutput("scatplot1")
                  
                  
                  
              )
      ),
      tabItem("map", 
              fluidRow(
                box(width = 12, status = "info",
                    title = "World Fertility Trends ",
                    sliderInput("Year",
                                "Year:",
                                min = 1961,
                                max = 2007,
                                value = 1, step = 4, sep = "")),
                box(width = 12, status = "info",
                    title = "World Fertility Trends",
                    
                    plotOutput("Map")
                    
                )
                
              
      ) 
      
      
    )
  )
)
)



