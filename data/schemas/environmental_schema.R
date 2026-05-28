# Data Validation Schema for Environmental Dataset
# Author: Automated validation framework
# Purpose: Define validation rules for penguin/climate measurement data

library(validate)

#' Environmental Data Validation Schema
#'
#' Validation rules for the climate_data dataset (penguin morphometrics).
#'
#' @return A validator object containing all validation rules
#' @export
environmental_validation_schema <- validate::validator(
  # === Column Existence Rules ===
  "Required column: species must exist" =
    "species" %in% names(.),

  "Required column: island must exist" =
    "island" %in% names(.),

  "Required column: year must exist" =
    "year" %in% names(.),

  # === Data Type Rules ===
  "bill_length_mm must be numeric" =
    if ("bill_length_mm" %in% names(.)) is.numeric(bill_length_mm) else TRUE,

  "bill_depth_mm must be numeric" =
    if ("bill_depth_mm" %in% names(.)) is.numeric(bill_depth_mm) else TRUE,

  "flipper_length_mm must be numeric" =
    if ("flipper_length_mm" %in% names(.)) is.numeric(flipper_length_mm) else TRUE,

  "body_mass_g must be numeric" =
    if ("body_mass_g" %in% names(.)) is.numeric(body_mass_g) else TRUE,

  # === Value Range Rules ===
  "bill_length_mm must be plausible (0-100 mm)" =
    if ("bill_length_mm" %in% names(.)) {
      all(bill_length_mm > 0 & bill_length_mm < 100, na.rm = TRUE)
    } else {
      TRUE
    },

  "bill_depth_mm must be plausible (0-50 mm)" =
    if ("bill_depth_mm" %in% names(.)) {
      all(bill_depth_mm > 0 & bill_depth_mm < 50, na.rm = TRUE)
    } else {
      TRUE
    },

  "flipper_length_mm must be plausible (0-300 mm)" =
    if ("flipper_length_mm" %in% names(.)) {
      all(flipper_length_mm > 0 & flipper_length_mm < 300, na.rm = TRUE)
    } else {
      TRUE
    },

  "body_mass_g must be plausible (0-10000 g)" =
    if ("body_mass_g" %in% names(.)) {
      all(body_mass_g > 0 & body_mass_g < 10000, na.rm = TRUE)
    } else {
      TRUE
    },

  "sex must be male/female/NA" =
    if ("sex" %in% names(.)) {
      all(sex %in% c("male", "female", NA))
    } else {
      TRUE
    },

  "Year must be plausible (1900-2100)" =
    if ("year" %in% names(.)) {
      all(year >= 1900 & year <= 2100, na.rm = TRUE)
    } else {
      TRUE
    },

  # === Completeness Rules ===
  "species column must not have missing values" =
    if ("species" %in% names(.)) !any(is.na(species)) else TRUE
)
