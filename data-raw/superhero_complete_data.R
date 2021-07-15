# Building complete dataset of superhero data.

Sys.setenv('SUPERHERO_TOKEN' = '3834352793310985')

library(superheroR)
library(tidyverse)
library(xml2)
library(rvest)
library(janitor)
library(dplyr)
library(purrr)
library(here)
library(janitor)
library(readr)


superhero_list <- character_ids %>%
  distinct(id) %>%
  #slice(1:10) %>%
  pluck('id')


# Getting information all superheros
## Powerstats
powerstats <- superhero_list %>%
  map_df(~get_powerstats(character_id = .x))

## Biography
bio <- superhero_list %>%
  map_df(~get_bio(character_id = .x))

## Appearance
appearance <- superhero_list %>%
  map_df(~get_appearance(character_id = .x))

## Work
work <- superhero_list %>%
  map_df(~get_work(character_id = .x))

## Connection
connections <- superhero_list %>%
  map_df(~get_connections(character_id = .x))

## Image
image <- superhero_list %>%
  map_df(~get_connections(character_id = .x))



# Joining all the data together

superhero_complete <- appearance %>%
  left_join(bio) %>%
  left_join(connections) %>%
  left_join(powerstats) %>%
  left_join(work) %>%
  clean_names()



# Writing data
write_csv(superhero_complete, "data-raw/superhero_complete_data.csv")
save(superhero_complete, file = "data/superhero_complete_data.rda")



