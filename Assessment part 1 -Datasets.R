

# Assessment PART 1 ------------------------------------------------------------
#Create multiple simulated (or fabricated) datasets, 
#each of which have the same format. Note: This should be data you create, 
#not download. There is no requirement for the data to be realistic and you can 
#choose the topic, format, variables and values.

# Load libraries
library(tidyverse)
# Add any additional packages required here
library(dplyr)
library(lubridate)
library(ggplot2)

# Function to create a messy datasets
create_messy_dataset <- function(n) {
  data.frame(
    ID = c(1:n, sample(1:n, n/5, replace = TRUE)),  # Duplicate some IDs
    Age = sample(c(18:70, NA), n + n/5, replace = TRUE),  # Add NAs
    Income = round(rnorm(n + n/5, mean = 50000, sd = 15000), 2),
    Gender = sample(c("Male", "Female", NA, "M", "F"), n + n/5, replace = TRUE),  # Varied Gender labels and NA
    Satisfaction = sample(c(1:5, NA), n + n/5, replace = TRUE),
    Date = sample(c("01-01-2021", "02/01/2021", NA, "2021-01-03"), n + n/5, replace = TRUE)  # Inconsistent date formats
  )
}

messy_dataset1 <- create_messy_dataset(100)
messy_dataset2 <- create_messy_dataset(150)
messy_dataset3 <- create_messy_dataset(120)


# Clean messy_dataset1
cleaned_dataset1 <- messy_dataset1 %>%
# Deduplicate rows by ID and other variables
  distinct() %>%
  
# Replace inconsistent Gender labels and handle missing values
  mutate(Gender = recode(Gender, "M" = "Male", "F" = "Female"),
         Gender = if_else(is.na(Gender), "Unknown", Gender)) %>%
  
# Standardize date formats and handle missing values
  mutate(Date = lubridate::parse_date_time(Date, orders = c("dmy", "mdy", "ymd")),
         Date = if_else(is.na(Date), as.Date("2021-01-01"), Date)) %>%
  
# Remove extreme outliers in Income column and replace missing values with median
  mutate(Income = if_else(Income > 100000, NA_real_, Income),
         Income = if_else(is.na(Income), median(Income, na.rm = TRUE), Income)) %>%
  
# Replace missing Age values with median age
  mutate(Age = if_else(is.na(Age), median(Age, na.rm = TRUE), Age)) %>%
  
# Handle missing Satisfaction scores by setting to 3 (neutral)
  mutate(Satisfaction = if_else(is.na(Satisfaction), 3, Satisfaction))


# Convert cleaned dataset to long format
long_format <- cleaned_dataset1 %>%
  pivot_longer(cols = c(Age, Income, Satisfaction),
               names_to = "Variable",
               values_to = "Value")

long_format

# Save the dataset for RMarkdown use

setwd("C:/Users/dibe_/OneDrive/Desktop/UHI Git-RStudio/Intro_to_R_Data_Vis/R/RMarkdown Reports")
saveRDS(cleaned_dataset1, "cleaned_dataset1.rds")
write.csv(cleaned_dataset1, "cleaned_dataset1.csv", row.names = FALSE)



# Evaluation of Step 1
#
# The datasets generated are simulated collections of demographic and 
# behavioral data, each with columns for ID, Age, Income, Gender, Satisfaction, 
# and Date. 
# Data cleaning removed duplicate rows for accuracy and clarity
#in the Gender column.
# Missing values in key fields, such as Age and Income, were filled with 
# median values to ensure a full dataset without compromising the results. 
# Date formats were unified, and extreme Income values were addressed to provide 
# realistic data representations.
#
# Transforming the dataset from wide to long format allowed flexibility in 
# analysis, enabling comparisons across variables, while implementing 
# feedback received from the preivous assignment, producing a cleaner,  
# consistent dataset that is reader-friendly and ready for analysis. 


