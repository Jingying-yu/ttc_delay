#### Preamble ####
# Purpose: Test for any errors or missteps in the data cleaning process
# Author: Sandy Yu
# Date: 15 September 2024
# Contact: jingying.yu@mail.utoronto.ca
# License: MIT
# Pre-requisites: cleaned data and created parquets for each dataset


#### Workspace setup ####
library(testthat)

#### Load data ####
bus_delay <- read.csv("outputs/cleaned_data/bus/bus_delay.csv")
weekday_bus_delay <- read.csv("outputs/cleaned_data/bus/weekday_bus_delay.csv")
bus_delay_rush <- read.csv("outputs/cleaned_data/bus/bus_delay_rush.csv")

streetcar_delay <- read.csv("outputs/cleaned_data/streetcar/streetcar_delay.csv")
weekday_streetcar_delay <- read.csv("outputs/cleaned_data/streetcar/weekday_streetcar_delay.csv")
streetcar_delay_rush <- read.csv("outputs/cleaned_data/bus/streetcar_delay_rush.csv")

subway_delay <- read.csv("outputs/cleaned_data/subway/subway_delay.csv")
weekday_subway_delay <- read.csv("outputs/cleaned_data/subway/weekday_subway_delay.csv")
subway_delay_rush <- read.csv("outputs/cleaned_data/bus/subway_delay_rush.csv")
subway_delay_code <- read.csv("outputs/cleaned_data/subway_delay_code.csv")

#### Test data ####

### Bus Data ###
# Test Suite for Bus Delay Dataset
test_that("Check column types in bus_delay dataset", {
  
  # Test that 'date' column is in Date format
  expect_true(class(bus_delay$date) == "Date", info = "'date' column should be in Date format")
  
  # Test that 'min_delay' column is numeric
  expect_true(is.numeric(bus_delay$min_delay), info = "'min_delay' column should be numeric")
  
  # Test that 'location' column is character
  expect_true(is.character(bus_delay$location), info = "'location' column should be character")
  
  # Test that 'incident' column is character
  expect_true(is.character(bus_delay$incident), info = "'incident' column should be character")
})

# Check that 'date', 'location', and 'min_delay' columns do not have any missing values
test_that("Check for missing values in key columns", {
  expect_false(any(is.na(bus_delay$date)), info = "'date' column should not have missing values")
  expect_false(any(is.na(bus_delay$location)), info = "'location' column should not have missing values")
  expect_false(any(is.na(bus_delay$min_delay)), info = "'min_delay' column should not have missing values")
  expect_false(any(is.na(bus_delay$incident)), info = "'incident' column should not have missing values")
})

# Test to check that all dates are within the range of 2023-01-01 to 2023-12-31
test_that("Check that dates are within 2023", {
  
  # Define the start and end of the acceptable date range
  start_date <- as.Date("2023-01-01")
  end_date <- as.Date("2023-12-31")
  
  # Check that all dates fall within the specified range
  expect_true(all(bus_delay$date >= start_date & bus_delay$date <= end_date), 
              info = "All dates should be between 2023-01-01 and 2023-12-31")
})

# Test to check there are no NA values in the weekday dataset
test_that("No NA values in date, time, and min_delay columns", {
  expect_true(all(!is.na(weekday_bus_delay$date)))
  expect_true(all(!is.na(weekday_bus_delay$time)))
  expect_true(all(!is.na(weekday_bus_delay$min_delay)))
})

# Test to check that the 'day' column only contains weekdays
test_that("Day column only contains Monday to Friday", {
  valid_days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
  expect_true(all(weekday_bus_delay$day %in% valid_days))
})


### Streetcar Data ###
# Test Suite for Streetcar Delay Dataset
test_that("Check column types in streetcar_delay dataset", {
  
  # Test that 'date' column is in Date format
  expect_true(class(streetcar_delay$date) == "Date", info = "'date' column should be in Date format")
  
  # Test that 'min_delay' column is numeric
  expect_true(is.numeric(streetcar_delay$min_delay), info = "'min_delay' column should be numeric")
  
  # Test that 'location' column is character
  expect_true(is.character(streetcar_delay$location), info = "'location' column should be character")
  
  # Test that 'incident' column is character
  expect_true(is.character(streetcar_delay$incident), info = "'incident' column should be character")
})

# Check that 'date', 'location', and 'min_delay' columns do not have any missing values
test_that("Check for missing values in key columns", {
  expect_false(any(is.na(streetcar_delay$date)), info = "'date' column should not have missing values")
  expect_false(any(is.na(streetcar_delay$location)), info = "'location' column should not have missing values")
  expect_false(any(is.na(streetcar_delay$min_delay)), info = "'min_delay' column should not have missing values")
  expect_false(any(is.na(streetcar_delay$incident)), info = "'incident' column should not have missing values")
})

# Test to check that all dates are within the range of 2023-01-01 to 2023-12-31
test_that("Check that dates are within 2023", {
  
  # Define the start and end of the acceptable date range
  start_date <- as.Date("2023-01-01")
  end_date <- as.Date("2023-12-31")
  
  # Check that all dates fall within the specified range
  expect_true(all(streetcar_delay$date >= start_date & streetcar_delay$date <= end_date), 
              info = "All dates should be between 2023-01-01 and 2023-12-31")
})

# Test for weekday
# Check for no NA values in date, time, and min_delay columns
test_that("No NA values in date, time, and min_delay columns for weekday_streetcar_delay", {
  expect_true(all(!is.na(weekday_streetcar_delay$date)))
  expect_true(all(!is.na(weekday_streetcar_delay$time)))
  expect_true(all(!is.na(weekday_streetcar_delay$min_delay)))
})

# Test for weekday_streetcar_delay: Check that the 'day' column only contains Monday to Friday
test_that("Day column only contains Monday to Friday in weekday_streetcar_delay", {
  valid_days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
  expect_true(all(weekday_streetcar_delay$day %in% valid_days))
})

### Subway Data ###
# Test Suite for Subway Delay Dataset
test_that("Check column types in subway_delay dataset", {
  
  # Test that 'date' column is in Date format
  expect_true(class(subway_delay$date) == "Date", info = "'date' column should be in Date format")
  
  # Test that 'min_delay' column is numeric
  expect_true(is.numeric(subway_delay$min_delay), info = "'min_delay' column should be numeric")
  
  # Test that 'location' column is character
  expect_true(is.character(subway_delay$location), info = "'location' column should be character")
  
  # Test that 'code' column is character
  expect_true(is.character(subway_delay$code), info = "'code' column should be character")
})

# Check that 'date', 'location', and 'min_delay' columns do not have any missing values
test_that("Check for missing values in key columns", {
  expect_false(any(is.na(subway_delay$date)), info = "'date' column should not have missing values")
  expect_false(any(is.na(subway_delay$location)), info = "'location' column should not have missing values")
  expect_false(any(is.na(subway_delay$min_delay)), info = "'min_delay' column should not have missing values")
  expect_false(any(is.na(subway_delay$code)), info = "'code' column should not have missing values")
})

# Test to check that all dates are within the range of 2023-01-01 to 2023-12-31
test_that("Check that dates are within 2023", {
  
  # Define the start and end of the acceptable date range
  start_date <- as.Date("2023-01-01")
  end_date <- as.Date("2023-12-31")
  
  # Check that all dates fall within the specified range
  expect_true(all(subway_delay$date >= start_date & subway_delay$date <= end_date), 
              info = "All dates should be between 2023-01-01 and 2023-12-31")
})

# Test for weekday
# Check for no NA values in date, time, and min_delay columns
test_that("No NA values in date, time, and min_delay columns for weekday_subway_delay", {
  expect_true(all(!is.na(weekday_subway_delay$date)))
  expect_true(all(!is.na(weekday_subway_delay$time)))
  expect_true(all(!is.na(weekday_subway_delay$min_delay)))
})

# Test for weekday_subway_delay: Check that the 'day' column only contains Monday to Friday
test_that("Day column only contains Monday to Friday in weekday_subway_delay", {
  valid_days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
  expect_true(all(weekday_subway_delay$day %in% valid_days))
})


### Subway Delay Code ###
# Test 1: Check that all values in the dataset are non-null
test_that("All values in subway_delay_code are non-null", {
  expect_true(all(!is.na(subway_delay_code)), info = "Dataset should not have any null (NA) values")
})

# Test 2: Check that both columns are of class 'character'
test_that("Columns in subway_delay_code are of class 'character'", {
  expect_true(is.character(subway_delay_code[[1]]), info = "First column should be character")
  expect_true(is.character(subway_delay_code[[2]]), info = "Second column should be character")
})

# Test 3: Check that the 'code' column (first column) does not contain any values with spaces
test_that("'code' column does not contain values with leading, trailing, or multiple spaces", {
  # Remove leading and trailing whitespace and check if the values are the same as the original
  cleaned_code <- trimws(subway_delay_code[[1]])  # Remove leading/trailing spaces
  expect_true(all(cleaned_code == subway_delay_code[[1]]), info = "'code' column should not have leading or trailing spaces")
  
  # Check for multiple spaces within the values
  expect_false(any(grepl("\\s{2,}", subway_delay_code[[1]])), info = "'code' column should not have multiple spaces between words")
})





# Define a function to check if time is within rush hour range
is_within_rush_hour <- function(time_col) {
  time_parsed <- as.POSIXct(time_col, format = "%H:%M", tz = "UTC")
  morning_start <- as.POSIXct("07:00", format = "%H:%M", tz = "UTC")
  morning_end <- as.POSIXct("09:00", format = "%H:%M", tz = "UTC")
  evening_start <- as.POSIXct("16:00", format = "%H:%M", tz = "UTC")
  evening_end <- as.POSIXct("19:00", format = "%H:%M", tz = "UTC")
  
  # Check if time falls within morning or evening rush hours
  return((time_parsed >= morning_start & time_parsed <= morning_end) |
           (time_parsed >= evening_start & time_parsed <= evening_end))
}

# Test for bus_delay_rush: Check for no NA values in date, time, and min_delay columns
test_that("No NA values in date, time, and min_delay columns for bus_delay_rush", {
  expect_true(all(!is.na(bus_delay_rush$date)))
  expect_true(all(!is.na(bus_delay_rush$time)))
  expect_true(all(!is.na(bus_delay_rush$min_delay)))
})

# Test for bus_delay_rush: Check that the 'time' column is within rush hour times (7-9am or 4-7pm)
test_that("Time column only contains values between 7am to 9am or 4pm to 7pm in bus_delay_rush", {
  expect_true(all(is_within_rush_hour(bus_delay_rush$time)))
})

# Test for streetcar_delay_rush: Check for no NA values in date, time, and min_delay columns
test_that("No NA values in date, time, and min_delay columns for streetcar_delay_rush", {
  expect_true(all(!is.na(streetcar_delay_rush$date)))
  expect_true(all(!is.na(streetcar_delay_rush$time)))
  expect_true(all(!is.na(streetcar_delay_rush$min_delay)))
})

# Test for streetcar_delay_rush: Check that the 'time' column is within rush hour times (7-9am or 4-7pm)
test_that("Time column only contains values between 7am to 9am or 4pm to 7pm in streetcar_delay_rush", {
  expect_true(all(is_within_rush_hour(streetcar_delay_rush$time)))
})

# Test for subway_delay_rush: Check for no NA values in date, time, and min_delay columns
test_that("No NA values in date, time, and min_delay columns for subway_delay_rush", {
  expect_true(all(!is.na(subway_delay_rush$date)))
  expect_true(all(!is.na(subway_delay_rush$time)))
  expect_true(all(!is.na(subway_delay_rush$min_delay)))
})

# Test for subway_delay_rush: Check that the 'time' column is within rush hour times (7-9am or 4-7pm)
test_that("Time column only contains values between 7am to 9am or 4pm to 7pm in subway_delay_rush", {
  expect_true(all(is_within_rush_hour(subway_delay_rush$time)))
})
