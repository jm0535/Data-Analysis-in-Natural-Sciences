# Data Analysis Examples for Workshop Manual
# This file contains example code snippets used in the workshop manual

# Load necessary packages
library(rstatix)
library(ggplot2)
library(knitr)
library(tidyverse)

# ---- Example 1: Correlation Analysis ----

# Load the dataset
forest_data <- readr::read_csv("./docs/data/Filtered.csv")

# Summarize and check data
summary(forest_data[1:4])
tibble::glimpse(forest_data)

# Perform a Pearson correlation test
correlation_result <- forest_data %>% 
  rstatix::cor_test(
    vars = "Tree_Density_per_ha",
    vars2 = "Aboveground_Tree_Carbon_ton_per_ha",
    alternative = "two.sided",
    method = "pearson",
    conf.level = 0.95,
    use = "pairwise.complete.obs"
  )

# Print the correlation result
print(correlation_result %>% knitr::kable())

# ---- Example 2: Regression Analysis ----

# Create a scatter plot with regression line using base R
plot(
  Aboveground_Tree_Carbon_ton_per_ha_per_year ~ 
    Tree_Density_per_ha, 
  data = forest_data,
  ylab = "AGTC (tonnes/ha/year)",
  xlab = "Tree density (ha)",
  type = "p",
  cex = 2,
  main = "Relationship Between Tree Density and Carbon"
)

# Add regression line
abline(
  lm(forest_data$Aboveground_Tree_Carbon_ton_per_ha_per_year ~ 
      forest_data$Tree_Density_per_ha), 
  lty = 2, 
  col = "red", 
  lwd = 4
)

# ---- Example 3: Box Plot Analysis ----

# Create a box plot using ggplot2
ggplot2::ggplot(
  data = forest_data,
  aes(
    x = Management_regime,
    y = Aboveground_Tree_Carbon_ton_per_ha_per_year,
    fill = Management_regime
  )
) +
  ggplot2::geom_boxplot() +
  ggplot2::labs(
    y = "AGTC (tonnes/ha/year)",
    x = "Management Regime",
    fill = "Management Regime",
    title = "Carbon Storage by Management Regime"
  ) +
  ggplot2::theme_bw()

# ---- Example 4: Scatter Plot with Smoothed Line ----

# Create a scatter plot with smoothed line using ggplot2
ggplot2::ggplot(
  data = forest_data,
  aes(
    x = Tree_Density_per_ha,
    y = Aboveground_Tree_Carbon_ton_per_ha_per_year
  )
) +
  ggplot2::geom_point(size = 3, alpha = 0.7) +
  ggplot2::labs(
    y = "AGTC (tonnes/ha/year)",
    x = "Tree density (ha)",
    title = "Relationship Between Tree Density and Carbon Storage"
  ) +
  ggplot2::geom_smooth(method = "lm") +
  ggplot2::theme_bw()

# ---- Example 5: Distribution Analysis ----

# Load example dataset
data("CO2")

# Create a histogram of CO2 uptake
hist(
  CO2$uptake, 
  main = "Histogram of CO2 Uptake", 
  xlab = "CO2 Uptake",
  col = "skyblue",
  border = "white"
)

# Create a density plot
plot(
  density(CO2$uptake), 
  main = "Density Plot of CO2 Uptake", 
  xlab = "CO2 Uptake",
  col = "blue",
  lwd = 2
)

# ---- Example 6: Measures of Central Tendency and Variability ----

# Calculate basic statistics
co2_mean <- mean(CO2$uptake)
co2_median <- median(CO2$uptake)
co2_sd <- sd(CO2$uptake)
co2_var <- var(CO2$uptake)
co2_range <- range(CO2$uptake)
co2_iqr <- IQR(CO2$uptake)

# Print results
cat("CO2 Uptake Statistics:\n")
cat("Mean:", co2_mean, "\n")
cat("Median:", co2_median, "\n")
cat("Standard Deviation:", co2_sd, "\n")
cat("Variance:", co2_var, "\n")
cat("Range:", co2_range[1], "to", co2_range[2], "\n")
cat("Interquartile Range:", co2_iqr, "\n")
