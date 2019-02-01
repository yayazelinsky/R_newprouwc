#Day 4: Intro to R, Chapter 10, tidying up data
#Author; Ayanda
#Date: 01.02.2019

load("data/sactn_mangled.RData") #RDATA thus use load command

library(tidyverse)

ggplot(SACTN1, aes(x=date, y=temp))+
  geom_line(aes(colour = site, group = paste0 (site, src))) + 
  labs(x="Date", y="Temp")#paste0, con #when grouping more than one variable use past0, two different variables
#look at group, in the port Nolloth data you can see the two sources?
#labels=labs

#SACTN1, this was our tidy data
#SACTN2 is not tidy
#tidy data is longer than it is wider. 
#can use the gather function to tidy up data

SACTN2_tidy <- SACTN2 %>%
  gather(KZNSB, DEA, SAWS, key = "src", value = "temp")#key, name of the column?, the columns that have not been "gathered" will require a new name to best describe the data
#value, would be the values that were in these columns?

SACTN3_tidy <- SACTN3 %>%
  spread(key = var, value = val) #be too long, meaning when individual observations are spread across multiple rows, we will
#need to use spread() to rectify the situation #"key" is the name of the column
#"value" are the values that will go under the column you have created?

SACTN4a_tidy <- SACTN4a %>%
  separate(col = index, into = c("site", "src"), sep = "/ ") #sperate the column "index",  into two columns use concartenate function"c("site", "src"), seperating by "/"

SACTN4b_tidy <- SACTN4b %>%
  unite(year, month, day, col = "date", sep = "-") #uniting the three columns into one column, where they are now seperated by a dash/hyphen
#col=column, new column called date

SACTN4_tidy <- left_join(SACTN4a_tidy, SACTN4b_tidy) #combining dataset that are tidy to make one full dataset
#function detects similar variables, thus joining all data under the various variables





