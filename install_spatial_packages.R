# Install spatial packages needed for conservation chapter
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Function to install packages if not already installed
install_if_missing <- function(packages) {
  new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
  if(length(new_packages)) {
    message("Installing packages: ", paste(new_packages, collapse = ", "))
    install.packages(new_packages)
  } else {
    message("All required packages are already installed.")
  }
}

# Spatial packages
spatial_packages <- c(
  "sf",              # Simple features for spatial data
  "terra",           # Spatial data analysis
  "raster",          # Raster data analysis
  "landscapemetrics", # Landscape metrics calculation
  "rnaturalearth",   # Natural Earth data
  "rnaturalearthdata", # Natural Earth data
  "rgeos",           # Geometry operations
  "dismo",           # Species distribution modeling
  "spData",          # Spatial datasets
  "tmap",            # Thematic maps
  "leaflet",         # Interactive maps
  "mapview"          # Interactive viewing of spatial data
)

# Install spatial packages
install_if_missing(spatial_packages)

message("Spatial packages installation complete!")
