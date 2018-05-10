library(readxl)
library(dplyr)
library(tidyr)
library(mplot)
library(ggplot2)

total_fertility <- read_excel("data/indicator undata total_fertility.xlsx")
agriculture_land <- read_excel("data/agriculture land.xlsx")
female_bmi <- read_excel("data/Indicator_BMI female ASM.xlsx")
urban_population <- read_excel("data/indicator wdi urbanpopulation.xlsx")
gdp_per_capita_ppp <- read_excel("data/indicator gapminder gdp_per_capita_ppp.xlsx")
food_consumption <- read_excel("data/indicator food_consumption.xlsx")
survivingkids_35 <- read_excel("data/indicator survivingkids 35.xlsx")
life_expectancy <- read_excel("data/indicator life_expectancy_at_birth.xlsx")
under_5_mortality <- read_excel("data/indicator gapminder under5mortality.xlsx")

#under_5_mortality[!apply(under_5_mortality == "", 1, all),]

tidy_mortality <- gather(data = under_5_mortality, key = year, value = mortality, 2:217)
names(tidy_mortality)[1] <- "country"
tidy_mortality <- dplyr::filter(tidy_mortality, year >= 1960)
tidy_mortality <- transform(tidy_mortality, year = as.numeric(year))

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

tidy_life_exp <- gather(data = life_expectancy, key = year, value = life_expectancy, 2:218)
names(tidy_life_exp)[1] <- "country"
tidy_life_exp <- transform(tidy_life_exp, year = as.numeric(year))
tidy_life_exp <- dplyr::filter(tidy_life_exp, year >= 1960)

tidy_urban <- gather(data = urban_population, key = year, value = urban_population, 2:53)
names(tidy_urban)[1] <- "country"
tidy_urban <- transform(tidy_urban, year = as.numeric(year))

tidy_food <- gather(data = food_consumption, key = year, value = food_consumption, 2:48)
names(tidy_food)[1] <- "country"
tidy_food <- transform(tidy_food, year = as.numeric(year))


tidy_surviving_kids <- gather(data = survivingkids_35, key = year, value = survivingkids_35, 2:256)
names(tidy_surviving_kids)[1] <- "country"
tidy_surviving_kids <- transform(tidy_surviving_kids, year = as.numeric(year))
tidy_surviving_kids <- dplyr::filter(tidy_surviving_kids, year >= 1960)

tidy_gdp <- gather(data = gdp_per_capita_ppp, key = year, value = gdp_per_capita_ppp, 2:217)
names(tidy_gdp)[1] <- "country"
tidy_gdp <- transform(tidy_gdp, year = as.numeric(year))
tidy_gdp <- dplyr::filter(tidy_gdp, year >= 1960)


tidy_data <- merge(tidy_fertility, tidy_agriculture, by=c("country", "year"))
tidy_data <- merge(tidy_data, tidy_food, by=c("country", "year"))
tidy_data <- merge(tidy_data, tidy_life_exp, by=c("country", "year"))
tidy_data <- merge(tidy_data, tidy_surviving_kids, by=c("country", "year"))
tidy_data <- merge(tidy_data, tidy_gdp, by=c("country", "year"))
tidy_data <- merge(tidy_data, tidy_urban, by=c("country", "year"))
tidy_data <- dplyr::full_join(tidy_data, tidy_bmi, by=c("country", "year"))
tidy_final <- dplyr::slice(tidy_data, 1:8460)
names(tidy_final)[7] <- "surviving_kids_35"

finaldata <- read_excel("finalwithregion.xlsx")

finaldata <- within(finaldata, region[is.na(region) & country == 'Aruba'] <- 'Latin America')
finaldata <- within(finaldata, region[is.na(region) & country == 'Bosnia and Herzegovina'] <- 'Europe & Central Asia')
finaldata <- subset(finaldata, country!= 'Bosnia-Herzegovina')
finaldata <- within(finaldata, region[is.na(region) & country == 'Cape Verde'] <- 'Sub-Saharan Africa')
finaldata <- subset(finaldata, country!= 'Cayman Islands')
finaldata <- subset(finaldata, country!= 'Central African Republic')
finaldata <- within(finaldata, region[is.na(region) & country == 'Channel Islands'] <- 'Europe & Central Asia')
finaldata <- within(finaldata, region[is.na(region) & country == 'Congo, Dem. Rep.'] <- 'Sub-Saharan Africa')
finaldata <- within(finaldata, region[is.na(region) & country == 'Congo, Rep.'] <- 'Sub-Saharan Africa')
finaldata <- within(finaldata, region[is.na(region) & country == 'Cote d\'Ivoire'] <- 'Sub-Saharan Africa')
finaldata <- subset(finaldata, country!= 'Dominica')
finaldata <- subset(finaldata, country!= 'Dominican Republic')
finaldata <- subset(finaldata, country!= 'Falkland Islands')
finaldata <- within(finaldata, region[is.na(region) & country == 'Guam'] <- 'East Asia & Pacific')
finaldata <- subset(finaldata, country!= 'Hong Kong')
finaldata <- within(finaldata, region[is.na(region) & country == 'Hong Kong, China'] <- 'East Asia & Pacific')
finaldata <- within(finaldata, region[is.na(region) & country == 'Macao, China'] <- 'East Asia & Pacific')
finaldata <- subset(finaldata, country!= 'Macau')
finaldata <- subset(finaldata, country!= 'Macedonia')
finaldata <- within(finaldata, region[is.na(region) & country == 'Macedonia, FYR'] <- 'Europe & Central Asia')
finaldata <- subset(finaldata, country!= 'Congo (Brazzaville)')
finaldata <- subset(finaldata, country!= 'Congo (Kinshasa)')
finaldata <- subset(finaldata, country!= 'Democratic Republic of the Congo')
finaldata <- within(finaldata, region[is.na(region) & country == 'Mayotte'] <- 'Sub-Saharan Africa')
finaldata <- within(finaldata, region[is.na(region) & country == 'Micronesia, Fed. Sts.'] <- 'East Asia & Pacific')
finaldata <- within(finaldata, region[is.na(region) & country == 'Mongolia'] <- 'East Asia & Pacific')
finaldata <- within(finaldata, region[is.na(region) & country == 'Oman'] <- 'Europe & Central Asia')
finaldata <- within(finaldata, region[is.na(region) & country == 'Samoa'] <- 'East Asia & Pacific')
finaldata <- within(finaldata, region[is.na(region) & country == 'Tonga'] <- 'East Asia & Pacific')
finaldata <- within(finaldata, region[is.na(region) & country == 'West Bank and Gaza'] <- 'Europe & Central Asia')
finaldata <- subset(finaldata, country!= 'West Bank and Gaza')
finaldata <- within(finaldata, region[is.na(region) & country == 'Sao Tome and Principe'] <- 'Sub-Saharan Africa')

finaldata <- select(finaldata, -X)


final_data <- merge(finaldata, tidy_mortality, by=c("country", "year"))
final_data <- final_data[c("country", "year", "fertility", "mortality", "survivingkids_35", "life_expectancy", "agricultural_land", "food_consumption", "bmi", "gdp_per_capita_ppp", "urban_population", "region")]
names(final_data)[12] <- "region"
names(final_data)[10] <- "gdp_per_capita"
names(final_data)[5] <- "surviving_kids_35"