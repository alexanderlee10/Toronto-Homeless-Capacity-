#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)

# Load the cleaned data
file_path <- "data/processed_data/cleaned_shelter_data.csv"
data <- read_csv(file_path)

# Test 1: Check for missing values
if (sum(is.na(data)) == 0) {
  print("Test 1 Passed: No missing values.")
} else {
  print(paste("Test 1 Failed: There are", sum(is.na(data)), "missing values."))
}

# Test 2: Validate data types
if (class(data$OCCUPANCY_DATE) == "Date") {
  print("Test 2 Passed: OCCUPANCY_DATE is in the correct format.")
} else {
  print("Test 2 Failed: OCCUPANCY_DATE is not formatted correctly.")
}

# Print success message
print("Data tests completed.")

