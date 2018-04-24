library(readxl)
library(dplyr)
library(tidyr)
total_fertility <- read_excel("data/indicator undata total_fertility.xlsx")
agriculture_land <- read_excel("data/agriculture land.xlsx")
female_bmi <- read_excel("data/Indicator_BMI female ASM.xlsx")
urban_population <- read_excel("data/indicator wdi urbanpopulation.xlsx")

tidy_fertility <- gather(data = total_fertility, key = year, value = fertility, 2:217)
names(tidy_fertility)[1] <- "country"
tidy_fertility <- dplyr::filter(tidy_fertility, year >= 1960)
tidy_fertility <- transform(tidy_fertility, year = as.numeric(year))

tidy_agriculture <- gather(data = agriculture_land, key = year, value = agricultural_land, 2:53)
as.numeric(tidy_agriculture)[2]
names(tidy_agriculture)[1] <- "country"
tidy_agriculture <- transform(tidy_agriculture, year = as.numeric(year))

tidy_bmi <- gather(data = female_bmi, key = year, value = bmi, 2:30)
names(tidy_bmi)[1] <- "country"
tidy_bmi <- transform(tidy_bmi, year = as.numeric(year))

tidy_urban <- gather(data = urban_population, key = year, value = urban_population, 2:53)
names(tidy_urban)[1] <- "country"
tidy_urban <- transform(tidy_urban, year = as.numeric(year))



tidy_data <- merge(tidy_fertility, tidy_agriculture, by=c("country", "year"))
tidy_data <- merge(tidy_data, tidy_urban, by=c("country", "year"))
tidy_data <- dplyr::full_join(tidy_data, tidy_bmi, by=c("country", "year"))
tidy_final <- dplyr::slice(tidy_data, 1:10453)

other_tidy <- dplyr::full_join(tidy_fertility, tidy_agriculture, by = c("country", "year"))
other_tidy <- dplyr::full_join(other_tidy, tidy_urban, by = c("country", "year"))
other_tidy <- dplyr::full_join(other_tidy, tidy_bmi, by = c("country", "year"))
