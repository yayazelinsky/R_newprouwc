#Day 3
#second session
#Author: Ayanda Zide
#Date: 31.01.2019

#hOMEWORK NO 3: DESCRIOE TWO PACKAGES
# Load libraries
library(tidyverse)
library(scales)
library(ggsn)
# Load Africa map
load("data/africa_map.RData")

ggplot() +
  borders() + # The global shape file
  coord_equal() # Equal sizing for lon/lat

sa_1 <- ggplot() +
  borders(fill = "grey70", colour = "black") +
  coord_equal(xlim = c(12, 36), ylim = c(-38, -22), expand = 0) # Force lon/lat extent, #co-ordinates of South Africa so that that is the only information that you get
sa_1

sa_2 <- sa_1 +
  annotate("text", label = "Atlantic\nOcean",
           x = 15.1, y = -32.0,
           size = 5.0,
           angle = 30,
           colour = "red") +
  annotate("text", label = "Indian\nOcean",
           x = 33.2, y = -34.2,
           size = 5.0,
           angle = 330,
           colour = "red")
sa_2