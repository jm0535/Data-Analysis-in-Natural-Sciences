# Scripts for Data Analysis in Natural Sciences

This directory contains utility scripts for setting up and managing the book project.

## Script Descriptions

### `download_datasets.R`

Downloads all datasets required for the book examples from their original sources. The script:

- Creates necessary data directories if they don't exist
- Downloads datasets from public repositories
- Creates citation files with proper attribution
- Handles errors gracefully with informative messages

**Usage:**

```r
# From R
source("scripts/download_datasets.R")

# From terminal
Rscript scripts/download_datasets.R
```

### `install_packages.R`

Installs all R packages required for the general analyses in the book.

**Usage:**

```r
# From R
source("scripts/install_packages.R")

# From terminal
Rscript scripts/install_packages.R
```

### `install_spatial_packages.R`

Installs specialized R packages required for spatial analyses in the book. These are separated due to their complex dependencies.

**Usage:**

```r
# From R
source("scripts/install_spatial_packages.R")

# From terminal
Rscript scripts/install_spatial_packages.R
```

## Maintenance

When updating the book with new examples or datasets:

1. Update the `download_datasets.R` script with new dataset sources
2. Update the package installation scripts if new dependencies are added
3. Run the scripts to ensure all data and packages are available
