# Data Validation Schema for Economics Dataset
# Author: Automated validation framework
# Purpose: Define validation rules for coffee quality / economic data

library(validate)

#' Economics Data Validation Schema
#'
#' Validation rules for the economic dataset (coffee ratings).
#'
#' @return A validator object containing all validation rules
#' @export
economics_validation_schema <- validate::validator(
  # === Column Existence Rules ===
  "Required column: total_cup_points must exist" =
    "total_cup_points" %in% names(.),

  "Required column: species must exist" =
    "species" %in% names(.),

  "Required column: country_of_origin must exist" =
    "country_of_origin" %in% names(.),

  # === Data Type Rules ===
  "total_cup_points must be numeric" =
    if ("total_cup_points" %in% names(.)) is.numeric(total_cup_points) else TRUE,

  "aroma must be numeric" =
    if ("aroma" %in% names(.)) is.numeric(aroma) else TRUE,

  "altitude_mean_meters must be numeric" =
    if ("altitude_mean_meters" %in% names(.)) is.numeric(altitude_mean_meters) else TRUE,

  # === Value Range Rules ===
  "total_cup_points must be between 0 and 100" =
    if ("total_cup_points" %in% names(.)) {
      all(total_cup_points >= 0 & total_cup_points <= 100, na.rm = TRUE)
    } else {
      TRUE
    },

  "Sensory scores (aroma) must be 0-10" =
    if ("aroma" %in% names(.)) {
      all(aroma >= 0 & aroma <= 10, na.rm = TRUE)
    } else {
      TRUE
    },

  "Flavor must be 0-10" =
    if ("flavor" %in% names(.)) {
      all(flavor >= 0 & flavor <= 10, na.rm = TRUE)
    } else {
      TRUE
    },

  "Moisture must be 0-1" =
    if ("moisture" %in% names(.)) {
      all(moisture >= 0 & moisture <= 1, na.rm = TRUE)
    } else {
      TRUE
    },

  "Altitude must be plausible (<= 9000 m)" =
    if ("altitude_mean_meters" %in% names(.)) {
      all(altitude_mean_meters >= 0 & altitude_mean_meters <= 9000, na.rm = TRUE)
    } else {
      TRUE
    },

  "Species must be Arabica or Robusta" =
    if ("species" %in% names(.)) {
      all(species %in% c("Arabica", "Robusta", NA))
    } else {
      TRUE
    },

  # === Completeness Rules ===
  "total_cup_points column must not have missing values" =
    if ("total_cup_points" %in% names(.)) !any(is.na(total_cup_points)) else TRUE
)
