#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)

# Create the directories if they don't exist
if (!dir.exists("data")) {
  dir.create("data")
}

if (!dir.exists("data/processed_data")) {
  dir.create("data/processed_data")
}

# Load the raw data
file_path <- "/Users/alexlee/Desktop/raw_shelter_data.csv"
data <- read_csv(file_path)

# View the first few rows of the dataset to ensure it loaded correctly
head(data)

# Clean and convert necessary columns, such as dates and calculate new fields
data_cleaned <- data %>%
  mutate(OCCUPANCY_DATE = as.Date(OCCUPANCY_DATE, format = "%Y-%m-%d"),
         UNOCCUPIED_BEDS = CAPACITY_ACTUAL_BED - OCCUPIED_BEDS,
         OCCUPANCY_RATE_BEDS = OCCUPIED_BEDS / CAPACITY_ACTUAL_BED)

# Check for any NAs or invalid dates
print(paste("Number of NA values in OCCUPANCY_DATE:", sum(is.na(data_cleaned$OCCUPANCY_DATE))))

# Save the cleaned data for further analysis
write_csv(data_cleaned, "data/processed_data/cleaned_shelter_data.csv")

# Print success message
print("Data cleaned and saved successfully.")
