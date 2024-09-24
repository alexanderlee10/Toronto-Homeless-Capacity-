#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

# Path to the actual dataset (replace this with the correct path)
file_path <- "/Users/alexlee/Desktop/daily-shelter-overnight-service-occupancy-capacity-2023.csv"

# Try reading the dataset with error handling
if (file.exists(file_path)) {
  data <- read_csv(file_path)
  print("File loaded successfully.")
} else {
  stop("File not found. Please check the file path.")
}

# Create necessary directories
if (!dir.exists("data/raw_data")) {
  dir.create("data/raw_data", recursive = TRUE)
}

# Save the raw data for further analysis
write_csv(data, "data/raw_data/raw_shelter_data.csv")

# Print success message
print("Data downloaded successfully.")
         
