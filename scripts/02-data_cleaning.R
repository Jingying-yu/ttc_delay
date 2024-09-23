#### Preamble ####
# Purpose: Cleans the raw data, keeping only variables we need to explore
# Author: Sandy Yu
# Date: 15 September 2024
# Contact: jingying.yu@mail.utoronto.ca
# License: MIT
# Pre-requisites: downloaded appropriate datasets and understood what variables needed keeping.


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)
library(readxl)
library(readr)


#### Read data ####
bus_delay_2023 <- read_excel("inputs/data/downloaded_xlsx_format/bus_delay_2023.xlsx")
streetcar_delay_2023 <- read_excel("inputs/data/downloaded_xlsx_format/streetcar_delay_2023.xlsx")
subway_delay_2023 <- read_excel("inputs/data/downloaded_xlsx_format/subway_delay_2023.xlsx")
subway_delay_code <- read_excel("inputs/data/downloaded_xlsx_format/subway_delay_code.xlsx")

#### Clean data ####

###Delay Data ###
bus_delay <-
  bus_delay_2023 |>
  janitor::clean_names() |>
  mutate(date = as.Date(date, format = "%Y-%m-%d"))

streetcar_delay <-
  streetcar_delay_2023 |>
  janitor::clean_names() |>
  mutate(date = as.Date(date, format = "%Y-%m-%d"))

subway_delay <-
  subway_delay_2023 |>
  janitor::clean_names() |>
  mutate(date = as.Date(date, format = "%Y-%m-%d")) |>
  rename(location = station)


### Subway Delay Code ###
#clean name of columns
subway_delay_code <- subway_delay_code |>
  janitor::clean_names() |>
  select(-1, -4, -5)

#take non-null values of columns. 6 and 7 and create a temporary dataset
temp_data <- subway_delay_code |>
  filter(!is.na(subway_delay_code[[3]]), !is.na(subway_delay_code[[4]])) %>%  # Filter out rows where either column 3 or 4 is NA
  select(3, 4) |>
  rename(sub_rmenu_code = colnames(subway_delay_code)[3],  # Rename column 3
         code_description_3 = colnames(subway_delay_code)[4])

#select only column 1 and 2 for subway_delay_code
subway_delay_code <- subway_delay_code |>
  select(1, 2) |> rename(code = sub_rmenu_code, code_description = code_description_3)

#rbind the two datasets
subway_delay_code <- rbind(subway_delay_code, temp_data)


### Build Filterized Dataset Based on Mastercopy Delay Datasets ###

## Weekday Delay
#filter out delays that occurred on weekdays
weekday_bus_delay <- bus_delay |>
  filter(day %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday"))
weekday_streetcar_delay <- streetcar_delay |>
  filter(day %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday"))
weekday_subway_delay <- subway_delay |>
  filter(day %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday"))


## Rush-Hour Delay
# Bus
bus_delay_time <- weekday_bus_delay |>
  mutate(time = as_hms(paste0(time, ":00"))) |>  # Convert 'time' to HH:MM:SS format
  arrange(time)  # Sort 'time' column in ascending order

bus_delay_rush <- bus_delay_time |>
  filter(time >= as_hms("07:00:00") & time <= as_hms("19:00:00")) |>
  filter(time < as_hms("09:00:00") | time > as_hms("16:00:00")) |>
  mutate(rush_type = ifelse(time <= as_hms("09:00:00"), "morning", "evening"))

# Streetcar
streetcar_delay_time <- weekday_streetcar_delay |>
  mutate(time = as_hms(paste0(time, ":00"))) |>  # Convert 'time' to HH:MM:SS format
  arrange(time)  # Sort 'time' column in ascending order

streetcar_delay_rush <- streetcar_delay_time |>
  filter(time >= as_hms("07:00:00") & time <= as_hms("19:00:00")) |>
  filter(time < as_hms("09:00:00") | time > as_hms("16:00:00")) |>
  mutate(rush_type = ifelse(time <= as_hms("09:00:00"), "morning", "evening"))


# Subway
subway_delay_time <- weekday_subway_delay |>
  mutate(time = as_hms(paste0(time, ":00"))) |>  # Convert 'time' to HH:MM:SS format
  arrange(time)  # Sort 'time' column in ascending order

subway_delay_rush <- subway_delay_time |>
  filter(time >= as_hms("07:00:00") & time <= as_hms("19:00:00")) |>
  filter(time < as_hms("09:00:00") | time > as_hms("16:00:00")) |>
  mutate(rush_type = ifelse(time <= as_hms("09:00:00"), "morning", "evening"))



#### Save data ####
write_csv(bus_delay, "inputs/data/cleaned_data/bus/bus_delay.csv")
write_csv(weekday_bus_delay, "inputs/data/cleaned_data/bus/weekday_bus_delay.csv")
write_csv(bus_delay_rush, "inputs/data/cleaned_data/bus/bus_delay_rush.csv")


write_csv(streetcar_delay, "inputs/data/cleaned_data/streetcar/streetcar_delay.csv")
write_csv(weekday_streetcar_delay, "inputs/data/cleaned_data/streetcar/weekday_streetcar_delay.csv")
write_csv(streetcar_delay_rush, "inputs/data/cleaned_data/streetcar/streetcar_delay_rush.csv")


write_csv(subway_delay, "inputs/data/cleaned_data/subway/subway_delay.csv")
write_csv(weekday_subway_delay, "inputs/data/cleaned_data/subway/weekday_subway_delay.csv")
write_csv(subway_delay_rush, "inputs/data/cleaned_data/subway/subway_delay_rush.csv")


write_csv(subway_delay_code, "inputs/data/cleaned_data/subway_delay_code.csv")

