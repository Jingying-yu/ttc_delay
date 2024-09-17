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

#### Save data ####
write_csv(bus_delay, "inputs/data/cleaned_data/bus_delay.csv")

write_csv(streetcar_delay, "inputs/data/cleaned_data/streetcar_delay.csv")

write_csv(subway_delay, "inputs/data/cleaned_data/subway_delay.csv")

write_csv(subway_delay_code, "inputs/data/cleaned_data/subway_delay_code.csv")

