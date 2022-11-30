#' import_data
#'
#' @param src A path
#'
#' @return a dataframe
#' @export
#'
#' @examples
import_data <- function(src){
  if (!file.exists(src)){
    print("This file doesn't exist")
  }
  else{
    return(readr::read_csv(src))
  }
}

#' import_wildfinder
#' Import all file from the wildfinder database
#'
#' @return
#' @export
#'
#' @examples
import_wildfinder <- function(){
  path = here::here("data", "wildfinder")
  
  file_name = "/wildfinder-ecoregions_list.csv"
  ecoregions_list = import_data(paste0(path, file_name))
  
  file_name = "/wildfinder-ecoregions_species.csv"
  ecoregions_species = import_data(paste0(path, file_name))
  
  file_name = "/wildfinder-mammals_list.csv"
  mammals_list = import_data(paste0(path, file_name))
  
  return (list(ecoregions_list, ecoregions_species, mammals_list))
}
