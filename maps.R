# load required packages
library(maptools) # creates maps and work with spatial files
library(broom)    # assists with tidy data
library(ggplot2)  # graphics package
library(leaflet)  # interactive graphics (output does not show in RMD files)
library(readr)    # quickly reads files into R
library(dplyr)
library(readxl)
library(mosaic)
library(maps)

countries <- read_excel("countries.xlsx")
finalwithregion <- read_excel("MAT295_Final/finalwithregion.xlsx")
finaldata <- left_join(finalwithregion, countries, by = "country")


geom_point(data = finaldata, 
               aes(x = longitude, y = latitude, size = fertility, color = region))

library(leaflet)


# addTiles()  Add background map
# setView( Set where the map should originally zoom to
leaflet() %>%
  addTiles() %>% 
  setView(lng = 10, lat = 50, zoom = 4) %>% 
  addCircleMarkers(data = finaldata,
                   lat = ~latitude, lng = ~longitude,
                   radius = ~urban_population,
                   color = "red", fillColor = "yellow")

bins <- c(0, 2, 4, 6, 8, 10)
pal <- colorBin("YlOrRd", domain = finalwithregion$fertility, bins = bins)

leaflet(data = finalwithregion) %>%
  addTiles() %>% 
  setView(lng = 10, lat = 50, zoom = 4) %>% 
  addPolygons(color = "red", fillColor = ~pal(fertility), fillOpacity = 0.9)

leaflet(data = finaldata) %>%
 # addTiles(urlTemplate = stamen_tiles,  
   #        attribution = stamen_attribution) %>%
  setView(0, 0, zoom = 3) %>%
  addPolygons(fillColor = ~pal(countries2[[indicator]]), 
              fillOpacity = 0.8, 
              color = "#BDBDC3", 
              weight = 1, 
              popup = country_popup)

# Basic choropleth with leaflet?
leaflet(finaldata) %>% 
  addTiles()  %>% 
  setView( lat=10, lng=0 , zoom=2) %>%
  addPolygons(  stroke=FALSE )


leaflet() %>%
  addTiles() %>% 
  setView(lng = 10, lat = 50, zoom = 4) %>% 
  addPolygons(data = finaldata,
                   lat = ~latitude, lng = ~longitude,
                   fillColor = "yellow")

# Plots map, coloring each country by the log(Gross Domestic Product)
ggplot() +
  geom_polygon(data = finaldata, 
               aes(x = longitude, y = latitude, group = region, fill = fertility), 
               color = "black") + 
  scale_fill_continuous(name="Fertility",limits = c(0,10),
                        breaks=c(2,4,6), 
                        low = "white", high = "darkblue")
geom_point(data = finaldata, 
           aes(x = longitude, y = latitude), 
           size = 1, color = "red")

preliminarymap <- left_join(finaldata, data("worldMapEnv"), by = country)

