select_species <- function(list_data, family_name){
  ecoregions_list = as.data.frame(list(list_data[1]))
  ecoregions_species = as.data.frame(list(list_data[2]))
  mammals_list = as.data.frame(list(list_data[3]))
  
  family_species = mammals_list[mammals_list$family==family_name,]
  
  data_family = merge(family_species, ecoregions_list)
  data_family = merge(data_family, ecoregions_species)
  
  return(data_family)
}

count_ecoregions <- function(data_family){
  nbr_species = unique(data_family$species)
  nbr_eco_species = data.frame(matrix(ncol = 2, nrow = length(nbr_species)))
  colnames(nbr_eco_species) = c("ecoregion", "nbr_species")
  for (i in 1:length(nbr_species)){
    nbr_eco_species$ecoregion[i] = nbr_species[i]
    nbr_eco_species$nbr_species[i] = length(unique(data_family$ecoregion_id[data_family$species==nbr_species[i]]))
  }
  return(nbr_eco_species)
}

plot_ecoregions <- function(){
  nbr_eco_species$ecoregion = as.factor(nbr_eco_species$ecoregion)
  nbr_eco_species$nbr_species = as.numeric(nbr_eco_species$nbr_species)
  
  ggplot2::ggplot(nbr_eco_species, aes(x = ecoregion, y = nbr_species))+
    geom_bar(stat = "identity") +
    coord_flip() +
    theme_bw() +
    labs(y = "Number of distinct ecoregions", x = "Species")
}
