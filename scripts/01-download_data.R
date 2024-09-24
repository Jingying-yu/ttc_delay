#### Preamble ####
# Purpose: Downloads data from OpenDataToronto and saves the data in csv format
# Author: Sandy Yu
# Date: 15 September 2024
# Contact: jingying.yu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Research on whether the sources are trustworthy and consider which datasets are necessary
# Please see the below notes on source of inauguration raw data.


#### Workspace setup ####
library(readxl)
library(readr)

#### Download & Save data ####
#download files from OpenDataToronto, there is only .xlsx format availble
#thus first download and read .xlsx then save as csv later

### Bus Data ###

download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/e271cdae-8788-4980-96ce-6a5c95bc6618/resource/10802a64-9ac0-4f2e-9538-04800a399d1e/download/ttc-bus-delay-data-2023.xlsx",
              "inputs/data/downloaded_xlsx_format/bus_delay_2023.xlsx", mode = "wb")
bus_delay_2023 <- read_excel("inputs/data/downloaded_xlsx_format/bus_delay_2023.xlsx")



### Streetcar Data ###

download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/b68cb71b-44a7-4394-97e2-5d2f41462a5d/resource/472d838d-e41a-4616-a11b-585d26d59777/download/ttc-streetcar-delay-data-2023.xlsx",
              "inputs/raw_data/streetcar_delay_2023.xlsx", mode = "wb")
streetcar_delay_2023 <- read_excel("inputs/raw_data/streetcar_delay_2023.xlsx")



### Subway Data ###

download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/996cfe8d-fb35-40ce-b569-698d51fc683b/resource/2fbec48b-33d9-4897-a572-96c9f002d66a/download/ttc-subway-delay-data-2023.xlsx",
              "inputs/raw_data/subway_delay_2023.xlsx", mode = "wb")
subway_delay_2023 <- read_excel("inputs/raw_data/subway_delay_2023.xlsx")

## Subway Delay Code ##

download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/996cfe8d-fb35-40ce-b569-698d51fc683b/resource/3900e649-f31e-4b79-9f20-4731bbfd94f7/download/ttc-subway-delay-codes.xlsx", 
              "inputs/raw_data/subway_delay_code.xlsx", mode = "wb")
subway_delay_code <- read_excel("inputs/raw_data/subway_delay_code.xlsx")
