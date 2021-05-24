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
library(readr)


superhero_list <- character_ids %>%
  distinct(id) %>%
  #slice(1:10) %>%
  pluck('id')


# Getting information all superheros
## Powerstats
powerstats <- superhero_list %>%
  map_df(~get_powerstats(character_id = .x)) %>%
  mutate(reference = "powerstat")

## Work
bio <- superhero_list %>%
  map_df(~get_bio(character_id = .x)) %>%
  mutate(reference = "bio")

## Appearance
appearance <- superhero_list %>%
  map_df(~get_appearance(character_id = .x)) %>%
  mutate(reference = "appearance")

## Work
work <- superhero_list %>%
  map_df(~get_work(character_id = .x)) %>%
  mutate(reference = "work")

## Connection
connections <- superhero_list %>%
  map_df(~get_connections(character_id = .x)) %>%
  mutate(reference = "connection")

## Connection
connections <- superhero_list %>%
  map_df(~get_connections(character_id = .x)) %>%
  mutate(reference = "connection")

## Image
imgage <- superhero_list %>%
  map_df(~get_connections(character_id = .x)) %>%
  mutate(reference = "imgage")



# Writing data
write_csv(character_ids, "data-raw/superhero_data.csv")
save(character_ids, file = "data/superhero_data.rda")



