#' Title
#'
#' @param access_token
#' @param character_id
#'
#' @return
#' @export
#'
#' @examples
get_powerstats <- function(access_token = Sys.getenv("SUPERHERO_TOKEN"), character_id) {

  base_url <- glue('https://superheroapi.com/api/{access_token}/{character_id}/powerstats')

  results <- GET(url = base_url)

  powerstats_df <- fromJSON(rawToChar(results$content)) %>%
    as_tibble()

  return(powerstats_df)

}


batman <- get_powerstats(character_id = 69)



radarchart(batman)
