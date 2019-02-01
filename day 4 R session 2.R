#Day 4: Intro to R, Chapter 11, tidier data
#Author; Ayanda
#Date: 01.02.2019

library(tidyverse) #load libraries that i will be using
library(lubridate) #our data has dates thus would be best to load this package


load("data/SACTNmonthly_v4.0.RData")

SACTN <- SACTNmonthly_v4.0 #copy the data as a dataframe with a shorter name
rm(SACTNmonthly_v4.0) #remove this dataset as we have already created another one using a shorter name

SACTN %>%
  filter(site = "Amanzimtoti")

SACTN %>%
  filter(site == "Amanzimtoti") #equal to is two equal signs, r won't recognise one equal sign
#filter, extract only the "Amanzimtoti" data from the dataset

SACTN %>%
  filter(site == "Pollock Beach", month(date) == 12 | month(date) == 1) #extract from the SACTN data, where the site is "Pollock Beach"
#and the 12th month  or (|) the first month. "month" is a function in this case that is why it is not in inverted commas

SACTN %>%
  arrange(depth, temp) # orders your data in Ascending order (lowest value to highest value)

SACTN %>%
  arrange(desc (temp)) # orders your temp in descending order

SACTN %>%
  filter(site == "Humewood", year(date) == 1990) #Select SACTN Dsataset, Extract data only for Humewood only for data collected in 1990

SACTN %>%
  filter(site == "Humewood", year(date) == 1993)

humewood_90s <- SACTN %>% #creating a new dataset from the SACTN Dsataset
  filter(site == "Humewood", year(date) %in% seq(1990, 1999, 1)) #show only the Humewood data, 

SACTN %>%
  filter(site == "Port Nolloth", # First give the site to filter
         src == "DEA", # Then specify the source
         temp <= 11 | # Temperatures at or below 11°C OR
           is.na(temp) # Include missing values
  )


try1<-SACTN %>%
  select(site, src, date, temp)# selected the columns that we want, thus excluding "depth" and "type"

try2<-SACTN %>%
  select(site:temp) #select the columns from site to temp

try3<-SACTN %>%
  select(-date, -depth) #select all columns without "date" and "depth"

try4<-SACTN %>%
  select(-(date:depth)) # select columns,exclude columns from date and depth

#some examples were not done, please do..

try5<-SACTN %>%
  mutate(kelvin = (temp + 273.15)) #creating a new column, new column will be Kelvin, where 273.15 will be added to "temp"

SACTN %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE)) #mean, variance, minimum , functions within the summarise function

SACTN %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE), #Sumarise, name "mean_temp" is is equal to the mean of the temperature column, removing the NAs
            sd_temp = sd(temp, na.rm = TRUE),    #see above same with the stadard deviation, minimum and maximum
            min_temp = min(temp, na.rm = TRUE), #good practice to always remove "NAS" in your data
            max_temp = max(temp, na.rm = TRUE)
  )



