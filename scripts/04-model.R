#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(broom)

# Load the cleaned data
file_path <- "data/processed_data/cleaned_shelter_data.csv"
data <- read_csv(file_path)

# Center and scale the predictor variables for better interpretability
data <- data %>%
  mutate(
    scaled_capacity = scale(CAPACITY_ACTUAL_BED, center = TRUE, scale = TRUE),
    scaled_service_users = scale(SERVICE_USER_COUNT, center = TRUE, scale = TRUE)
  )

# Fit a linear model: Predicting Occupancy Rate based on scaled capacity and service users
model <- lm(OCCUPANCY_RATE_BEDS ~ scaled_capacity + scaled_service_users, data = data)

# Get a tidy summary of the model, including confidence intervals
model_summary <- tidy(model, conf.int = TRUE)

# Display model summary with confidence intervals
print(model_summary)

# Visualize the relationship between capacity and occupancy rate with model fit
ggplot(data, aes(x = CAPACITY_ACTUAL_BED, y = OCCUPANCY_RATE_BEDS)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = TRUE, color = "blue") +
  theme_minimal() +
  labs(title = "Occupancy Rate vs Bed Capacity",
       x = "Actual Bed Capacity",
       y = "Occupancy Rate (Beds)")

# Create necessary directories for models
if (!dir.exists("models")) {
  dir.create("models")
}

# Save the model for future use
saveRDS(model, "models/improved_occupancy_model.rds")

# Print success message
print("Model created and saved successfully.")

