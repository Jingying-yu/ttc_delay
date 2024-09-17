#### Preamble ####
# Purpose: Simulates delay data for the entire paper to gather thoughts and avoid missteps
# Author: Sandy Yu
# Date: 15 September 2024
# Contact: jingying.yu@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A


#### Workspace setup ####
library(dplyr)

#### Simulate data ####

# Generate the sequence of dates from 2023-01-01 to 2023-12-31
start_date <- as.Date("2023-01-01")
end_date <- as.Date("2023-12-31")
date_range <- seq.Date(start_date, end_date, by = "day")

# Define the list of locations
locations <- c("Warden Station", "Union Station", "Finch Station", 
               "York Mills Station", "Egliton West Station")

# Function to generate random times between 02:30 and 23:00
generate_sorted_times <- function(start_time = "02:30", end_time = "23:00", n = 2) {
  start_sec <- as.numeric(as.POSIXct(start_time, format = "%H:%M"))
  end_sec <- as.numeric(as.POSIXct(end_time, format = "%H:%M"))
  
  random_seconds <- runif(n, start_sec, end_sec)  # Generate n random seconds between start and end
  random_times <- format(as.POSIXct(sort(random_seconds), origin = "1970-01-01"), "%H:%M")  # Sort times
  return(random_times)
}

# Create the simulated dataset
set.seed(21) # Set seed for reproducibility
simulated_delay <- data.frame()

for (n in 1:length(date_range)) {
  times <- generate_sorted_times(n = 2)  # 2 sorted random times for each date
  for (time in times) {
    row <- data.frame(
      date = date_range[n],  # Use date_range[n] for the date
      route = sample(1:199, 1),  # Random route between 1 and 199
      time = time,
      location = sample(locations, 1),  # Randomly pick a location
      min_delay = sample(0:20, 1)  # Random delay between 0 and 20 minutes
    )
    simulated_delay <- rbind(simulated_delay, row)  # Append the row
  }
}

# View the simulated dataset
head(simulated_delay)


