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
bus_delay <- read.csv("inputs/data/cleaned_data/bus_delay.csv")
streetcar_delay <- read.csv("inputs/data/cleaned_data/streetcar_delay.csv")
subway_delay <- read.csv("inputs/data/cleaned_data/subway_delay.csv")
subway_delay_code <- read.csv("inputs/data/cleaned_data/subway_delay_code.csv")

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

