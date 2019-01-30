#Day 1 Introdctory R
#Author: Ayanda
#Laminaria dataset exploring and learning
#date: 29 January 2019

#Loading Libraries

library(tidyverse)
lam <- read_csv("data/laminaria.csv")
head(lam)#head shows you the first six rows of your dataset, default
tail(lam)#head shows you the last six rows of your dataset, default
head(lam, n = 3)#head shows you the first  three rows of your dataset because  you have instructed it show the first three, n=3
tail(lam, n = 3)#tail shows you the last three rows of your dataset, you have instructed it show the last three, n=3

lam_select <- lam %>% #assigning
  select(site, total_length) #in the laminaria dataset, select only the site and total_length variables
  slice (54:80)#Slice row 54 to 80
  
View(lam)
lam_kom <- lam %>%
filter(site == "Kommetjie") #select laminaria dataset, filter (extract) only out the Kommetjie
lam_Sea <- lam %>%
filter(site == "Sea Point")
lam_Sea2 <- lam %>%
  select(site, blade_length) %>%
  filter(site == "Sea Point")
View(lam_Sea2)
lam %>%
  filter(total_length == max(total_length)) #from the Laminaria dataset, filter , the total length that is equal to the total length
lam %>%
  filter(total_length == min(total_length))#Read above, this time it is mninimum
summary(lam)
dim(lam) #dimentions, observations and varaiables
lam %>% #select laminaria dataset
  summarise(avrg_bl = mean(blade_length),
            med_bl = median(blade_length),
            stdev_bl = sd(blade_length)) #The piped dataset, then summarise, and give it a new name could have used another term instead of avrg_bl
lam %>% 
  group_by(site) %>% #group my data by site
  summarise(var_bl = var(blade_length), #then summarise
            n = n()) %>%
  mutate(se = sqrt(var_bl/n)) #creating a new column, use mutate, se, stadard error, term that we just gave for the new column
lam_2 <- lam %>% #trying to avoid changing the original data, thus creating a new dataset termed lam_2
  select (-blade_length, -blade_thickness)# using this to remove blade_thickness and blade_length from the dataset, by putting a minus sign

lam_count <- lam %>%
  select(stipe_mass) %>%
   summarise(n = n()) #how many entries for stipe_mass

lam_count <- lam %>%
  select(stipe_mass) %>%
  na.omit %>% #removing of invalid entries, eg where there is NA in data, so would use what is applicable to your dataset
  summarise(n = n()) #how many entries for stipe_mass

lam %>%
  select(blade_length) %>%
  summarise(n = n()) #how many entries for blade_length

 lam %>%
  select(blade_length) %>%
  na.omit %>% #removing of invalid entries, eg where there is NA in data, so would use what is applicable to your dataset
  summarise(n = n()) #how many entries for blade_length 
 
 #there is no difference since the are no "na" entries in the blade_length column
 total_length_half <- lam %>% #trying to avoid changing the original data, thus creating a new dataset termed lam_2
 mutate(total_length_half = total_length/2) %>%
 na.omit %>%
   filter(total_length_half >100)
 

   
 
  
