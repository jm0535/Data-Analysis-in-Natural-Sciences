# Data Analysis in Natural Sciences: Datasets

This directory contains datasets used in the book "Data Analysis in Natural Sciences: An R-Based Approach" by Dr. Jimmy Moses.

## Dataset Overview

1. **Agriculture** (`agriculture/`): 
   - **Crop Yields Dataset**: Global crop yield data from Our World in Data
   - File: `crop_yields.csv`
   - Used in: Exploratory Analysis, Visualization, and Regression chapters

2. **Ecology** (`ecology/`): 
   - **Plant Biodiversity Dataset**: Plant conservation status data from IUCN Red List
   - File: `biodiversity.csv`
   - Used in: Statistical Tests and Visualization chapters

3. **Forestry** (`forestry/`): 
   - **Forest Inventory Dataset**: Forest data with tree characteristics
   - File: `forest_inventory.csv`
   - Used in: Data Basics chapter

4. **Marine** (`marine/`): 
   - **Ocean Data**: Commercial fishing data from the Great Lakes
   - File: `ocean_data.csv`
   - Used in: Hypothesis Testing chapter

5. **Environmental** (`environmental/`): 
   - **Climate Dataset**: Palmer penguins dataset with environmental measurements
   - File: `climate_data.csv`
   - Used in: Advanced Visualization chapter

6. **Geography** (`geography/`): 
   - **Spatial Dataset**: Geospatial data from United Nations Office on Drugs and Crime
   - File: `spatial.csv`
   - Used in: Advanced Visualization and Regression chapters

7. **Botany** (`botany/`): 
   - **Plant Traits Dataset**: Plant pollution data from Break Free From Plastic
   - File: `plant_traits.csv`
   - Used in: Exploratory Analysis chapter

8. **Entomology** (`entomology/`): 
   - **Animal Dataset**: Animal outcomes data from Austin Animal Center
   - File: `insects.csv`
   - Used in: Statistical Tests chapter

9. **Epidemiology** (`epidemiology/`): 
   - **Disease Dataset**: Health-related time series data
   - File: `disease_data.csv`
   - Used in: Data Basics chapter

10. **Economics** (`economics/`): 
    - **Coffee Economics Dataset**: Coffee quality and economic data from Coffee Quality Institute
    - File: `economic.csv`
    - Used in: Regression chapter

## Data Documentation

Each dataset directory contains:
- The main data file (CSV format)
- A CITATION.txt file with complete source information and proper academic citation
- Some directories may include additional supplementary files

## Real-World Data

All datasets in this book are real data from reputable sources rather than fabricated examples. This provides students and researchers with authentic practice in analyzing the types of data they will encounter in their scientific careers.

## Data Access

The datasets can be accessed directly from their respective directories or loaded in R using code like:

```r
# Example for loading the crop yields dataset
library(readr)
crop_yields <- read_csv("data/agriculture/crop_yields.csv")
```

## Data Updates

To refresh or download missing datasets, run the `download_datasets.R` script in the root directory of the project:

```r
# From R
source("download_datasets.R")

# Or from terminal
Rscript download_datasets.R
