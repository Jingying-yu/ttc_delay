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

#### Download data ####
#download files from OpenDataToronto, there is only .xlsx format availble
#thus first download and read .xlsx then save as csv later

### Bus Data ###
#2020
download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/e271cdae-8788-4980-96ce-6a5c95bc6618/resource/e5f6e6cb-2b9f-4436-aab7-283e9460bc8f/download/ttc-bus-delay-data-2020.xlsx",
             "inputs/data/downloaded_xlsx_format/bus_delay_2020.xlsx", mode = "wb")
bus_delay_2020 <- read_excel("inputs/data/downloaded_xlsx_format/bus_delay_2020.xlsx")

#2021
download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/e271cdae-8788-4980-96ce-6a5c95bc6618/resource/94c11eb2-1465-47a2-b321-61f1e258f5a3/download/ttc-bus-delay-data-2021.xlsx",
              "inputs/data/downloaded_xlsx_format/bus_delay_2021.xlsx", mode = "wb")
bus_delay_2021 <- read_excel("inputs/data/downloaded_xlsx_format/bus_delay_2021.xlsx")

#2022
download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/e271cdae-8788-4980-96ce-6a5c95bc6618/resource/3b3c2673-5231-4aac-8b6a-dc558dce588c/download/ttc-bus-delay-data-2022.xlsx",
              "inputs/data/downloaded_xlsx_format/bus_delay_2022.xlsx", mode = "wb")
bus_delay_2022 <- read_excel("inputs/data/downloaded_xlsx_format/bus_delay_2022.xlsx")

#2023
download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/e271cdae-8788-4980-96ce-6a5c95bc6618/resource/10802a64-9ac0-4f2e-9538-04800a399d1e/download/ttc-bus-delay-data-2023.xlsx",
              "inputs/data/downloaded_xlsx_format/bus_delay_2023.xlsx", mode = "wb")
bus_delay_2023 <- read_excel("inputs/data/downloaded_xlsx_format/bus_delay_2023.xlsx")



### Streetcar Data ###
#2020
download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/b68cb71b-44a7-4394-97e2-5d2f41462a5d/resource/71b8b735-8a89-45a9-afb0-3edc38b2fad9/download/ttc-streetcar-delay-data-2020.xlsx",
              "inputs/data/downloaded_xlsx_format/streetcar_delay_2020.xlsx", mode = "wb")
streetcar_delay_2020 <- read_excel("inputs/data/downloaded_xlsx_format/streetcar_delay_2020.xlsx")

#2021
download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/b68cb71b-44a7-4394-97e2-5d2f41462a5d/resource/ecc4f0a8-25e6-40d8-ae70-8006e38c4f9a/download/ttc-streetcar-delay-data-2021.xlsx",
              "inputs/data/downloaded_xlsx_format/streetcar_delay_2021.xlsx", mode = "wb")
streetcar_delay_2021 <- read_excel("inputs/data/downloaded_xlsx_format/streetcar_delay_2021.xlsx")

#2022
download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/b68cb71b-44a7-4394-97e2-5d2f41462a5d/resource/28547222-35fe-48b6-ac4b-ccc67d286393/download/ttc-streetcar-delay-data-2022.xlsx",
              "inputs/data/downloaded_xlsx_format/streetcar_delay_2022.xlsx", mode = "wb")
streetcar_delay_2022 <- read_excel("inputs/data/downloaded_xlsx_format/streetcar_delay_2022.xlsx")

#2023
download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/b68cb71b-44a7-4394-97e2-5d2f41462a5d/resource/472d838d-e41a-4616-a11b-585d26d59777/download/ttc-streetcar-delay-data-2023.xlsx",
              "inputs/data/downloaded_xlsx_format/streetcar_delay_2023.xlsx", mode = "wb")
streetcar_delay_2023 <- read_excel("inputs/data/downloaded_xlsx_format/streetcar_delay_2023.xlsx")



### Subway Data ###
#2020
download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/996cfe8d-fb35-40ce-b569-698d51fc683b/resource/1ba66ead-cddf-453d-859d-b349d3286f02/download/ttc-subway-delay-data-2020.xlsx",
              "inputs/data/downloaded_xlsx_format/subway_delay_2020.xlsx", mode = "wb")
subway_delay_2020 <- read_excel("inputs/data/downloaded_xlsx_format/subway_delay_2020.xlsx")

#2021
download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/996cfe8d-fb35-40ce-b569-698d51fc683b/resource/c6e4f5eb-6ed7-4db1-944f-87406faa5a09/download/ttc-subway-delay-data-2021.xlsx",
              "inputs/data/downloaded_xlsx_format/subway_delay_2021.xlsx", mode = "wb")
subway_delay_2021 <- read_excel("inputs/data/downloaded_xlsx_format/subway_delay_2021.xlsx")

#2022
download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/996cfe8d-fb35-40ce-b569-698d51fc683b/resource/441143ca-8194-44ce-a954-19f8141817c7/download/ttc-subway-delay-data-2022.xlsx",
              "inputs/data/downloaded_xlsx_format/subway_delay_2022.xlsx", mode = "wb")
subway_delay_2022 <- read_excel("inputs/data/downloaded_xlsx_format/subway_delay_2022.xlsx")

#2023
download.file("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/996cfe8d-fb35-40ce-b569-698d51fc683b/resource/2fbec48b-33d9-4897-a572-96c9f002d66a/download/ttc-subway-delay-data-2023.xlsx",
              "inputs/data/downloaded_xlsx_format/subway_delay_2023.xlsx", mode = "wb")
subway_delay_2023 <- read_excel("inputs/data/downloaded_xlsx_format/subway_delay_2023.xlsx")




#### Save data ####

### Bus Data ###
write_csv(x = bus_delay_2020, file ="inputs/data/raw_csv/bus_delay_2020.csv")
write_csv(x = bus_delay_2021, file ="inputs/data/raw_csv/bus_delay_2021.csv")
write_csv(x = bus_delay_2022, file ="inputs/data/raw_csv/bus_delay_2022.csv")
write_csv(x = bus_delay_2023, file ="inputs/data/raw_csv/bus_delay_2023.csv")

### Streetcar Data ###
write_csv(x = streetcar_delay_2020, file ="inputs/data/raw_csv/streetcar_delay_2020.csv")
write_csv(x = streetcar_delay_2021, file ="inputs/data/raw_csv/streetcar_delay_2021.csv")
write_csv(x = streetcar_delay_2022, file ="inputs/data/raw_csv/streetcar_delay_2022.csv")
write_csv(x = streetcar_delay_2023, file ="inputs/data/raw_csv/streetcar_delay_2023.csv")

### Subway ###
write_csv(x = subway_delay_2020, file ="inputs/data/raw_csv/subway_delay_2020.csv")
write_csv(x = subway_delay_2021, file ="inputs/data/raw_csv/subway_delay_2021.csv")
write_csv(x = subway_delay_2022, file ="inputs/data/raw_csv/subway_delay_2022.csv")
write_csv(x = subway_delay_2023, file ="inputs/data/raw_csv/subway_delay_2023.csv")

