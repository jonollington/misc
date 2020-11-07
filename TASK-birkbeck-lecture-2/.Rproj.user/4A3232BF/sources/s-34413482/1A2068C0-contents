# load in the packages
library(tidyverse)

# read in the data
data <- read_csv("data/pl_f9_sample.csv")

# create a new column in the data to get the goals per 90 minutes and arrange the rows in order of this column
data_with_new_column <- data %>% 
  mutate(nineties = round(mins_played/90, 2),
         goals_p90 = round(goals/nineties, 2)) %>% 
  arrange(-goals_p90)

# let's have a look at the data now
View(data_with_new_column)

# there's a few players at the top of this list that haven't played very often

# let's filter for players who have played at least 1000 minutes and then take the top 10 players
filtered_data <- data_with_new_column %>%
  filter(mins_played > 1000) %>%
  head(10)

# that looks a lot better
View(filtered_data)
