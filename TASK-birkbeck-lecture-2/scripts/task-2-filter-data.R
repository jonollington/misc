# load in the packages
library(tidyverse)

# read in the data
data <- read_csv("data/pl_f9_sample.csv")

# store Jamie Vardy's player_id
vardy <- 101668

# filter down to just Vardy's data
filtered_data <- data %>% filter(player_id == vardy)

# let's have a look at the data for Jamie Vardy
View(filtered_data)
