# for One-Hot Encoding (OHE) 0,1
install.packages("fastDummies")

library(dplyr)
library(tidyverse)
library(readr)
library(ggplot2)
library(fastDummies)


# import data set.
cirrhosis <- read_csv("cirrhosis.csv")
View(cirrhosis)

## data preparing

# check Normal Distribution
ggplot(cirrhosis, aes(Age)) +
  geom_histogram(fill = "steelblue", color = "white") +
  theme_minimal()

# check NA / missing value.
colMeans(is.na(cirrhosis)) * 100

# review and summary the data.
glimpse(cirrhosis)

# drop only the row where the drug column is NA
cirrhosis_clean <- cirrhosis %>% 
  filter(!is.na(Drug))
view(cirrhosis_clean)

# Imputed missing values with Mean all of numeric
cirrhosis_imputed <- cirrhosis_clean %>% 
  mutate(across(where(is.numeric), ~replace_na(., mean(., na.rm = TRUE))))

# one hot encoding
names(cirrhosis)
cirrhosis_final <- dummy_cols(cirrhosis_imputed, 
                                select_columns = c("Sex", "Ascites", 
                                                   "Hepatomegaly", "Spiders",
                                                   "Edema"),
                                remove_selected_columns = TRUE,
                                remove_first_dummy = TRUE)

glimpse(cirrhosis_final)







