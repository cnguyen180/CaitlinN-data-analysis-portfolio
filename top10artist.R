library(readxl)
# Read the excel file into a data frame
data_set <- read_excel("/Users/caitlin/Desktop/spotify.xlsx")

library(pacman)
library(ggplot2)
pacman::p_load(dplyr)

# Create a ggplot bar chart for the top 10 artists with the most streams
top_artists <- data_set %>%
  arrange(desc(Streams)) %>%
  head(10)

ggplot(data = top_artists, aes(x = reorder(Artist, Streams), y = Streams)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(
    title = "Top 10 Artists with the Most Streams",
    x = "Artist",
    y = "Total Streams"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

