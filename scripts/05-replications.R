#### Preamble ####
# Purpose: Replicated graphs from... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
file_path <- "data/processed_data/cleaned_shelter_data.csv"
data <- read_csv(file_path)

# Filter the data for a specific city or service type (Toronto)
toronto_data <- data %>%
  filter(LOCATION_CITY == "Toronto")

# Scale the predictor variables for the Toronto subset
toronto_data <- toronto_data %>%
  mutate(
    scaled_capacity = scale(CAPACITY_ACTUAL_BED, center = TRUE, scale = TRUE),
    scaled_service_users = scale(SERVICE_USER_COUNT, center = TRUE, scale = TRUE)
  )

# Replicate the model on the Toronto subset
model_toronto <- lm(OCCUPANCY_RATE_BEDS ~ scaled_capacity + scaled_service_users, data = toronto_data)

# Summary of the Toronto model
summary(model_toronto)

# Plot for Toronto subset
ggplot(toronto_data, aes(x = CAPACITY_ACTUAL_BED, y = OCCUPANCY_RATE_BEDS)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  theme_minimal() +
  labs(title = "Occupancy Rate vs Bed Capacity (Toronto)",
       x = "Actual Bed Capacity",
       y = "Occupancy Rate (Beds)")

# Save the model for further use
saveRDS(model_toronto, "models/occupancy_model_toronto.rds")

# Print success message
print("Replications completed successfully.")


