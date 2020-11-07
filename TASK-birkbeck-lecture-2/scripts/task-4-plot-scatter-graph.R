# load in the packages
library(tidyverse)

# read in the data
data <- read_csv("data/pl_f9_sample.csv")

# manipulate our data
plot_data <- data %>% 
  mutate(nineties = round(mins_played/90, 2),
         goals_p90 = round(goals/nineties, 2),
         assists_p90 = round(assists/nineties, 2)) %>% 
  arrange(-goals_p90) %>%
  filter(mins_played > 1000)

# now let's try and plot our data

# EDIT THESE INPUTS TO ADJUST OUR GRAPH
title_text <- "Which players are scoring and creating the most goals?"
subtitle_text <- "Attacking Outputs Per 90 | Premier League | Season 2017/2018"
x_axis_text <- "Goals per 90"
y_axis_text <- "Assists per 90"

plot <- ggplot(plot_data, 
               aes(x = goals_p90, 
                   y = assists_p90)) +
  geom_point() +
  labs(x = x_axis_text,
       y = y_axis_text,
       title = title_text,
       subtitle = subtitle_text) + 
  theme_classic() +
  theme(plot.title = element_text(size = 15),
        plot.subtitle = element_text(size = 10))

# now let's have a look at our plot
plot

# let's save our plot in the "plots" folder
ggsave(plot, device = "png",
       path = "plots/",
       filename = "birkbeck-scatter-plot.png",
       width = 8, height = 6, dpi = 300)
