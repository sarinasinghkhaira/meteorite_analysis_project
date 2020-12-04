library(janitor)
library(tidyverse)

#Read in data and change names to fit naming standards
meteorite_landings <- read_csv("meteorite_landings.csv") %>%
  clean_names()

#Split column geo_location into numeric variables latitude and longitude
meteorite_landings_clean <- meteorite_landings %>% 
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