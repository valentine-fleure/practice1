#' Practice 1 - Research Compendium
#' 
#' @author Nicolas Casajus \email{nicolas.casajus@fondationbiodiversite.fr}
#' 
#' @date 2022/11/16



## Install Dependencies (listed in DESCRIPTION) ----

remotes::install_deps(upgrade = "never")


## Load Project Addins (R Functions and Packages) ----

pkgload::load_all()


## Run Project ----

source(here::here("analyses", "download-data.R"))


library(ggplot2)

rcompendium::add_dependencies()

list_data = import_wildfinder()
data_ursidae = select_species(list_data, "Ursidae")
nbr_eco_species = count_ecoregions(data_ursidae)
plot_ecoregions(nbr_eco_species)
