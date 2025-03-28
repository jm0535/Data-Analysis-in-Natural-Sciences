# R Functions for Data Analysis Workshop Manual

This directory contains R functions used throughout the data analysis workshop manual. These functions provide reusable code for common data analysis tasks and visualizations with a focus on ecological data analysis.

## Functions Overview

### `workshop_functions.R`

This file contains helper functions for data analysis and visualization:

1. **`load_ecological_data()`** - Loads and prepares ecological datasets from CSV files
   - Handles data cleaning
   - Removes missing values in key columns

2. **`correlation_table()`** - Creates formatted correlation tables
   - Supports Pearson, Spearman, and Kendall correlation methods
   - Returns a formatted kable table for use in R Markdown

3. **`scatter_plot_with_regression()`** - Creates scatter plots with regression lines
   - Customizable titles, labels, and styling
   - Built on ggplot2 for consistent aesthetics

4. **`box_plot()`** - Creates box plots for comparing groups
   - Useful for visualizing differences between categories
   - Automatically handles grouping and coloring

5. **`t_test_analysis()`** - Performs and visualizes t-tests
   - Returns test results, formatted table, and visualization
   - Handles both equal and unequal variance t-tests

6. **`histogram_with_density()`** - Creates histograms with density curves
   - Visualizes distributions of continuous variables
   - Customizable bins, colors, and labels

## Usage

To use these functions in the workshop manual or in your own R scripts:

```r
# Source the functions file
source("R/workshop_functions.R")

# Load required packages
library(tidyverse)
library(rstatix)
library(knitr)
library(ggplot2)

# Example usage
forest_data <- load_ecological_data("./docs/data/Filtered.csv")
correlation_table(forest_data, "Tree_Density_per_ha", "Aboveground_Tree_Carbon_ton_per_ha")
scatter_plot <- scatter_plot_with_regression(forest_data, 
                                            "Tree_Density_per_ha", 
                                            "Aboveground_Tree_Carbon_ton_per_ha")
print(scatter_plot)
```

## Dependencies

These functions require the following R packages:

- tidyverse (for data manipulation)
- ggplot2 (for visualization)
- rstatix (for statistical tests)
- knitr (for table formatting)

Make sure to install these packages before using the functions:

```r
install.packages(c("tidyverse", "ggplot2", "rstatix", "knitr"))
```
