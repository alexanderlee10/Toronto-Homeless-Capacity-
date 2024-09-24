#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)

# Set seed for reproducibility
set.seed(123)

# Define the number of records to simulate
n <- 1000

# Simulate data
simulated_data <- tibble(
  id = 1:n,  # Use id instead of _id (since _ is generally not recommended for variable names in R)
  OCCUPANCY_DATE = sample(seq(as.Date('2023-01-01'), as.Date('2023-12-31'), by="day"), n, replace = TRUE),
  ORGANIZATION_ID = sample(1001:1100, n, replace = TRUE),
  ORGANIZATION_NAME = paste("Organization", sample(1:100, n, replace = TRUE)),
  SHELTER_ID = sample(2001:2100, n, replace = TRUE),
  SHELTER_GROUP = paste("Shelter Group", sample(1:50, n, replace = TRUE)),
  CAPACITY_ACTUAL_BED = sample(50:200, n, replace = TRUE),
  OCCUPIED_BEDS = sample(0:200, n, replace = TRUE)
)

# Calculate occupancy rate
simulated_data <- simulated_data %>%
  mutate(UNOCCUPIED_BEDS = CAPACITY_ACTUAL_BED - OCCUPIED_BEDS,
         OCCUPANCY_RATE_BEDS = OCCUPIED_BEDS / CAPACITY_ACTUAL_BED)

# Create necessary directories
if (!dir.exists("data/simulated_data")) {
  dir.create("data/simulated_data", recursive = TRUE)
}

# Save the simulated data
write_csv(simulated_data, "data/simulated_data/simulated_data.csv")

# Print success message
print("Simulated data created successfully.")


