library(readxl)
library(dplyr)
library(tidyr)
total_fertility <- read_excel("data/indicator undata total_fertility.xlsx")
agriculture_land <- read_excel("data/agriculture land.xlsx")
female_bmi <- read_excel("data/Indicator_BMI female ASM.xlsx")
urban_population <- read_excel("data/indicator wdi urbanpopulation.xlsx")

tidy_fertility <- gather(data = total_fertility, key = year, value = fertility, 2:217)
tidy_agriculture <- gather(data = agriculture_land, key = year, value = agricultural_land, 2:53)
tidy_bmi <- gather(data = female_bmi, key = year, value = bmi, 2:30)
tidy_urban <- gather(data = urban_population, key = year, value = urban_population, 2:53)

