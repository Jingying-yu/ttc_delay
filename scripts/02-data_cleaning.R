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


#### Clean data ####
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




#### Save data ####
write_csv(bus_delay, "inputs/data/cleaned_data/bus_delay.csv")

write_csv(streetcar_delay, "inputs/data/cleaned_data/streetcar_delay.csv")

write_csv(subway_delay, "inputs/data/cleaned_data/subway_delay.csv")

