# Loading packages
library(xml2)
library(rvest)
library(janitor)
library(dplyr)
library(purrr)
library(here)
library(readr)

# Scraping site to obtain dataframe with ids and associated characters
url <- "https://superheroapi.com/ids.html"


character_ids <- url %>%
  read_html() %>%
  html_elements('table') %>%
  html_table() %>%
  reduce(union) %>%
  rename(
    id = X1,
    character = X2
  )

# Writing data
write_csv(character_ids, here("data", "character_ids.csv"))

