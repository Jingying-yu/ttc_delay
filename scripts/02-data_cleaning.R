#### Preamble ####
# Purpose: Cleans the raw data, keeping only variables we need to explore
# Author: Sandy Yu
# Date: 15 September 2024
# Contact: jingying.yu@mail.utoronto.ca
# License: MIT
# Pre-requisites: downloaded appropriate datasets and understood what variables needed keeping.


#### Workspace setup ####
library(tidyverse)
library(readr)
library(readxl)


#### Read data ####
bus_delay_2020 <- read_excel("inputs/data/downloaded_xlsx_format/bus_delay_2020.xlsx")
bus_delay_2021 <- read_excel("inputs/data/downloaded_xlsx_format/bus_delay_2021.xlsx")
bus_delay_2022 <- read_excel("inputs/data/downloaded_xlsx_format/bus_delay_2022.xlsx")
bus_delay_2023 <- read_excel("inputs/data/downloaded_xlsx_format/bus_delay_2023.xlsx")

streetcar_delay_2020 <- read_csv("inputs/data/raw_csv/streetcar_delay_2020.csv")
streetcar_delay_2021 <- read_csv("inputs/data/raw_csv/streetcar_delay_2021.csv")
streetcar_delay_2022 <- read_csv("inputs/data/raw_csv/streetcar_delay_2022.csv")
streetcar_delay_2023 <- read_csv("inputs/data/raw_csv/streetcar_delay_2023.csv")

subway_delay_2020 <- read_csv("inputs/data/raw_csv/subway_delay_2020.csv")
subway_delay_2021 <- read_csv("inputs/data/raw_csv/subway_delay_2021.csv")
subway_delay_2022 <- read_csv("inputs/data/raw_csv/subway_delay_2022.csv")
subway_delay_2023 <- read_csv("inputs/data/raw_csv/subway_delay_2023.csv")


#### Clean data ####
bus_delay <-
  rbind(bus_delay_2021, bus_delay_2022, bus_delay_2023)

head(bus_delay)


cleaned_inauguration <-
  raw_inauguration |>
  janitor::clean_names() |>
  filter(inauguration_date >= "1974-08-09") |>
  select(president, party, inauguration_date) |>
  mutate(change_party = as.integer(lag(party) != party & !is.na(lag(party)))) |>
  tidyr::drop_na()








#### Save data ####
write_csv(cleaned_exchange_rate, "data/analysis_data/cleaned_exchange_rate.csv")
write_parquet(cleaned_exchange_rate, "data/analysis_data/cleaned_exchange_rate.parquet")

write_csv(cleaned_inauguration, "data/analysis_data/cleaned_inauguration.csv")
write_parquet(cleaned_inauguration, "data/analysis_data/cleaned_inauguration.parquet")

write_csv(exchange_inaug, "data/analysis_data/exchange_inaug.csv")
write_parquet(exchange_inaug, "data/analysis_data/exchange_inaug.parquet")
