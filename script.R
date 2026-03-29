library(dplyr)
library(tidyverse)
library(readr)

# import data set.
cirrhosis <- read_csv("cirrhosis.csv")
View(cirrhosis)

# check NA / missing value.
colSums(is.na(cirrhosis))

# review and summary the data.
glimpse(cirrhosis)
summary(cirrhosis)

