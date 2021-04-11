#' Set SuperHero API Access Token
#'
#' @description This function sets the access token in the environment
#' @param access_token Provide the access token generated on the SuperHero API site
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' set_superhero_acces_token()
#' }




set_superhero_acces_token <- function(access_token = NULL) {

  Sys.setenv(SUPERHERO_TOKEN = {{access_token}})

  access_token <- Sys.getenv("SUPERHERO_TOKEN")

  return(access_token)

}


set_superhero_acces_token()
