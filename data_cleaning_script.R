library(janitor)
library(tidyverse)
library(assertr)

#Read in data and change names to fit naming standards
meteorite_landings <- read_csv("meteorite_landings.csv") 

#Check that the incoming data contains the correct variables
stopifnot(
  names(meteorite_landings) %in% c("id", 
                                   "name", 
                                   "mass (g)", 
                                   "fall", 
                                   "year", 
                                   "GeoLocation")
)

#Clean names 
meteorite_landings_clean <- clean_names(meteorite_landings)


#Split column geo_location into numeric variables latitude and longitude
meteorite_landings_clean <- meteorite_landings_clean %>% 
  mutate(geo_location = str_replace_all(geo_location, "\\(|\\)", "")) %>%
  separate(geo_location, 
           c("latitude", "longitude"), 
           sep = ", ",
           convert = TRUE)


#Convert NA values in latitude and longitude columns to zero
meteorite_landings_clean <- meteorite_landings_clean %>% 
  mutate(latitude = replace_na(latitude, 0),
         longitude = replace_na(longitude, 0))

#Remove meteorites less than 1000g in weight
meteorite_landings_clean <- meteorite_landings_clean %>% 
  filter(mass_g >= 1000) %>%
  arrange(year) 

#Check that latitude and longitude are valid values
#(Latitude between -90 and 90, longitude between -180 and 180).
meteorite_landings_clean %>%
  verify(latitude >= -90 & latitude <= 90) %>%
  verify(longitude >= -180 & longitude <= 180)
