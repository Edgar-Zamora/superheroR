#' Call that gives the biographical stats of the superhero.
#'
#' @param access_token Required. Unique token obtained from the SuperHero API site. Token should be set to the environment and will be retrieved
#' that way.
#' @param character_id Required. Required. The \href{https://superheroapi.com/ids.html}{Character ID} or name of the Superhero
#'
#' @return Returns a dataframe with the work/occupation  of the specific superhero.
#' @export
#' @importFrom janitor clean_names
#'
#'

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
      janitor::clean_names()

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


