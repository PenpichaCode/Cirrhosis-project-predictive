library(dplyr)
library(tidyverse)
library(readr)
library(ggplot2)

# import data set.
cirrhosis <- read_csv("cirrhosis.csv")
View(cirrhosis)

## data preparing

# check Normal Distribution
ggplot(cirrhosis, aes(Age)) +
  geom_histogram(fill = "steelblue", color = "white") +
  theme_minimal()

# check NA / missing value.
colSums(is.na(cirrhosis))

# review and summary the data.
glimpse(cirrhosis)

# drop only the row where the drug column is NA
cirrhosis_clean <- cirrhosis %>% 
  filter(!is.na(Drug))
view(cirrhosis_clean)

# Imputed missing values with Mean all of numeric
cirrhosis_imputed <- cirrhosis_clean %>% 
  mutate(across(where(is.numeric), ~replace_na(., mean(., na.rm = TRUE))))







