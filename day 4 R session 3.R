#Day 4: Intro to R, Chapter 12, tidiest data
#Author; Ayanda
#Date: 01.02.2019

library(tidyverse) #load libraries that i will be using
library(lubridate)

load("data/SACTNmonthly_v4.0.RData") #load dataset

SACTN <-SACTNmonthly_v4.0
rm(SACTNmonthly_v4.0) #remove dataset

SACTN_depth_mean <- SACTN %>% #creating new dataframe, from dataset SACTN
  group_by(depth)%>% #In the data, group by depth, does not change your data but keeps similar things in depth together 
summarise(mean_temp = mean(temp, na.rm = TRUE), #calculate the mean, give it the heading "mean_temp"
          count = n())

ggplot(data = SACTN_depth_mean, mapping = aes(x = depth, y = mean_temp)) +
  geom_point(aes(size = count), alpha = 1/3) + #plot the points
  geom_smooth(se = FALSE)

SACTN_30_years <- SACTN %>% #create new data frame
  group_by(site, src) %>% # group by site and source
  filter(n() > 360) #data that is more (>) than 30 years
SACTN_30_years


selected_sites <- c("Paternoster", "Oudekraal", "Muizenberg", "Humewood") #filtering with more than one column eg more than one site in this case
# use concatenate

#Then calculate the statistics
SACTN %>% #Select the SACTN dataset
  filter(site %in% selected_sites) %>% #filter site in the selected sites
  group_by(site, src) %>% #group by site and source
  summarise(mean_temp = mean(temp, na.rm = TRUE), #calculate mean and std deviation, to the assisgned columns
            sd_temp = sd(temp, na.rm = TRUE))
