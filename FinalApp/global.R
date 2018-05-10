library(maptools) # creates maps and work with spatial files
library(broom)    # assists with tidy data
library(ggplot2)  # graphics package
library(leaflet)  # interactive graphics (output does not show in RMD files)
library(readr)    # quickly reads files into R
library(dplyr)
library(readxl)
library(mosaic)
library(maps)
library(shiny)
library(sp)

finaldata <- read_excel("currentData.xlsx")
finaldata$country <- ifelse(finaldata$country=="United States", "United States of America", finaldata$country)
Worldshapes2 <- read_excel("Worldshapes.xlsx")
Worldshapes2$admin <- ifelse(Worldshapes2$admin=="United Republic of Tanzania", "Tanzania", Worldshapes2$admin)

tidy_shapes <- select(Worldshapes2, long, lat, group, admin)
names(tidy_shapes)[4] <- "country"

preliminarymap <- left_join(finaldata, tidy_shapes, by = "country") #was inner join
currentData <- select(preliminarymap, long, lat, group, country, fertility, year)

finaldata <- read_csv("finaldata.csv")
region <- read_excel("region.xlsx")

