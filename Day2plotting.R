#Day 2 Introdctory R - Plotting (ggplot)
#Author: Ayanda
#date: 30 January 2019

#load libraries
library(tidyverse)

chicks <- datasets::ChickWeight
view(chicks)
??ChickWeight

ggplot(data=chicks, aes(x=Time, y= weight)) +
  geom_point() +
  geom_line(aes(group = Chick)) #aes= aesthetics , specifiy  first line, which dataset R must look at and what needs to go on the different axes


ggplot(data=chicks, aes(x=Time, y= weight, colour = Diet)) +
  geom_point()+
  geom_line(aes(group = Chick)) #Use "+" when plotting not "%>%"


ggplot(data=chicks, aes(x=Time, y= weight, colour = Diet)) +
  geom_point()+
  geom_smooth(method= "lm") #Use 

ggplot(data=chicks, aes(x=Time, y= weight, colour = Diet)) +
  geom_point(colour= "blue")+
  geom_line(aes(group = Chick)) #Use 

ggplot(chicks, aes(x=Time, y= weight, colour = Diet)) +
  geom_point(aes(size = weight))+
  geom_smooth(method= "lm") #once in "aes" can then use "size"

ggplot(chicks, aes(x=Time, y= weight, colour = Diet)) +
  geom_point(aes(size = weight))+
  geom_smooth(method= "lm") +
  labs(x="Days", y= "Weight (kg)")+ #labs, changing or placiing the correct labels on your graph/plot
  ggtitle("A") +
  theme_bw()

ggplot(data=chicks, aes(x=Time, y= weight, colour = Diet)) +
  geom_point()+
  geom_smooth(method= "lm") +
  facet_wrap (-Diet, ncol=2) +
  labs(x="Days", y= "Weight (g)")

#Facetting in ggplot
library(ggpubr)

ggplot(chicks, aes(x=Time, y= weight, colour = Diet))+
  geom_point()+
  geom_smooth(method= "lm") +
  facet_wrap(~Diet, ncol = 2) #facet changes how your data is displayed

chicks_2 <- chicks %>%
  filter(Time == 21)

plot_1 <- ggplot(chicks, aes(x=Time, y= weight, colour = Diet))+
  geom_point()+
  geom_line (aes (group = Chick)) +
  labs (x = "Days" , y = "weight") +
  ggtitle ('A')

plot_1

plot_2 <- ggplot(chicks, aes(x=Time, y= weight, colour = Diet))+
  geom_point()+
  geom_smooth (method= "lm") +
   ggtitle ('B')

plot_2

plot_3 <- ggplot(chicks_2, aes(x=weight))+
  geom_histogram(aes(fill=Diet), position = "dodge", binwidth = 100)+
  labs (x = "Final Mass (g)" , y = "Count") 


plot_4 <- ggplot(chicks_2, aes(x= Diet, y= weight))+
  geom_boxplot(aes(fill=Diet))+
  labs (x = "Diet" , y = "Final Mass (g)")

plot_combined <- ggarrange(plot_1, plot_2, plot_3, plot_4)

chicks <- datasets::AirPassengers+ airmiles + ability.cov 
#Task choose three columns in the data set, and provide mean for one of them 

#3rd libraray 
library(boot)

urine <- boot:: urine
??urine

urine %>%
  select (-cond)

ggplot(, aes(x=Time, y= weight, colour = Diet))+
  geom_point()+
  geom_smooth(method= "lm") +
  facet_wrap(~Diet, ncol = 2) 
