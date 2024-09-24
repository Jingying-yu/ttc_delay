# TTC Delay Analysis

## Overview

TTC Service is one of the most popular way to travel around downtown Toronto, but varying levels of delay occurs with different types of TTC service. This [paper](https://github.com/Jingying-yu/ttc_delay/blob/main/outputs/paper/paper.pdf) will focus on analyzing 2023's TTC service delay magnitude and advise the reader on which TTC service to ride on at different days of the week, and different hours of the day using concrete quantitative analysis.

TTC Bus Delay data can be accessed [here](https://open.toronto.ca/dataset/ttc-bus-delay-data/)

TTC Streetcar Delay data can be accessed [here](https://open.toronto.ca/dataset/ttc-streetcar-delay-data/)

TTC Subway Delay data can be accessed [here](https://open.toronto.ca/dataset/ttc-subway-delay-data/)


## File Structure

The repo is structured as:

-   `inputs/sketches` contains the author's visualized thought of how to proceed with the acquired data, in hand-drawn format
-   `inputs/raw_data` contains the raw data as obtained from OpenDataToronto
-   `inputs/llms` contains chat history with Large Language Model ChatGPT 4o, which was used to assist the code construct througout the paper
-   `outputs/cleaned_data` contains the cleaned dataset that constructed for final analysis in the paper content.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `scripts` contains the R scripts used to simulate, download and clean data.

## Statement on LLM usage

Aspects of the paper are written with the help of ChatGPT and the entire chat history is available in inputs/llms/usage.txt.
