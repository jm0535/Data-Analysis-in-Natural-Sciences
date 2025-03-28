# Install required packages for the Data Analysis Workshop Manual
# Run this script once to set up all necessary packages

# Set CRAN mirror
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

# Basic packages
basic_packages <- c(
  "rmarkdown",
  "knitr",
  "ggplot2",
  "dplyr",
  "tidyr",
  "readr",
  "reshape2",
  "tidyverse"
)

# Statistics packages
stats_packages <- c(
  "rstatix",
  "car",
  "lme4",
  "MASS",
  "pwr",
  "FSA",
  "Kendall",
  "corrplot",
  "GGally"
)

# Visualization packages
viz_packages <- c(
  "DiagrammeR",
  "plotly",
  "viridis",
  "RColorBrewer",
  "pheatmap"
)

# Spatial and ecological packages
eco_packages <- c(
  "sf",
  "rnaturalearth",
  "rnaturalearthdata"
)

# Optional packages (uncomment if needed)
# optional_packages <- c(
#   "dismo",
#   "raster",
#   "landscapemetrics",
#   "terra"
# )

# Combine all packages
all_packages <- c(basic_packages, stats_packages, viz_packages, eco_packages)

# Install missing packages
install_if_missing(all_packages)

# Print confirmation message
message("Package installation complete. Your environment is now set up for the Data Analysis Workshop Manual.")
