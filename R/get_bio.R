#' Title
#'
#' @param access_token
#' @param character_id
#'
#' @return
#' @export
#'
#' @examples
get_bio <- function(access_token = Sys.getenv("SUPERHERO_TOKEN"), character_id) {

  if(is.character({{character_id}})) {

    load(file = here("data", "character_ids.rda"))

    cnvrt_char_str <- character_ids %>%
      filter(character == str_to_title({{character_id}})) %>%
      select(id) %>%
      pluck('id')

    base_url <- glue('https://superheroapi.com/api/{access_token}/{cnvrt_char_str}/biography')

    results <- GET(url = base_url)

    bio_df <- fromJSON(rawToChar(results$content)) %>%
      as_tibble() %>%
      clean_names()

    return(bio_df)

  } else{

    base_url <- glue('https://superheroapi.com/api/{access_token}/{character_id}/biography')

    results <- GET(url = base_url)

    bio_df <- fromJSON(rawToChar(results$content)) %>%
      as_tibble() %>%
      clean_names()

    return(bio_df)
  }

}


get_bio(character_id = "Batman")


