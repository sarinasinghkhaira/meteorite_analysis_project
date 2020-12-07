#Meteor Data Analysis

This project looks at meteorite data from NASA for meteorites that have been found up to the year 2013. 

Raw data can be found within the file `"meteorite_landings.csv"`

Data cleaning and analysis was performed on R, and is held within the R project `"meteor_analysis_project.Rproj`". 

The data was cleaned using the following packages on R: tidyverse, janitor and assertr. Steps taken to clean the data in "`data_cleaning_script.R`" were:

* 	 ensure that data read in contained expected variable names 
* 	 ensure variable names contained only small letters and underscores
* 	 split the geo location into two numeric columns for latitude and longitude
* 	 replace NA values in location with "0"
* 	 remove meteorites smaller than 1000g
* 	 arrange the data by year
* 	 ensure that latitude and longitude were within appropriate ranges

Analysis on the data was performed in R using dplyr to obtain:

* the 10 largest meteorites
* average number of fallen and found meteorites
* number of meteorites per year since 2000
* total number and average size of meteorites per latitude zone

The results can be found in the R notebook `"meteor_analysis.Rmd"`
 
 