# Data Validation Schema for Agriculture Dataset
# Author: Automated validation framework
# Purpose: Define validation rules for crop yield data

library(validate)

#' Agriculture Data Validation Schema
#'
#' Validation rules for crop yields (tonnes per hectare) by country/year.
#'
#' @return A validator object containing all validation rules
#' @export
agriculture_validation_schema <- validate::validator(
  # === Column Existence Rules ===
  "Required column: Entity must exist" =
    "Entity" %in% names(.),

  "Required column: Year must exist" =
    "Year" %in% names(.),

  "Required column: Code must exist" =
    "Code" %in% names(.),

  # === Data Type Rules ===
  "Year must be numeric/integer" =
    if ("Year" %in% names(.)) is.numeric(Year) else TRUE,

  "Wheat yield must be numeric" =
    if ("Wheat (tonnes per hectare)" %in% names(.)) {
      is.numeric(`Wheat (tonnes per hectare)`)
    } else {
      TRUE
    },

  "Rice yield must be numeric" =
    if ("Rice (tonnes per hectare)" %in% names(.)) {
      is.numeric(`Rice (tonnes per hectare)`)
    } else {
      TRUE
    },

  # === Value Range Rules ===
  "Year must be plausible (1900-2100)" =
    if ("Year" %in% names(.)) {
      all(Year >= 1900 & Year <= 2100, na.rm = TRUE)
    } else {
      TRUE
    },

  "Wheat yields must be non-negative" =
    if ("Wheat (tonnes per hectare)" %in% names(.)) {
      all(`Wheat (tonnes per hectare)` >= 0, na.rm = TRUE)
    } else {
      TRUE
    },

  "Wheat yields must be realistic (< 30 t/ha)" =
    if ("Wheat (tonnes per hectare)" %in% names(.)) {
      all(`Wheat (tonnes per hectare)` < 30, na.rm = TRUE)
    } else {
      TRUE
    },

  "Rice yields must be realistic (< 30 t/ha)" =
    if ("Rice (tonnes per hectare)" %in% names(.)) {
      all(`Rice (tonnes per hectare)` < 30, na.rm = TRUE)
    } else {
      TRUE
    },

  # === Completeness Rules ===
  "Entity column must not have missing values" =
    if ("Entity" %in% names(.)) !any(is.na(Entity)) else TRUE,

  "Year column must not have missing values" =
    if ("Year" %in% names(.)) !any(is.na(Year)) else TRUE,

  "Country code must be 3 characters when present" =
    if ("Code" %in% names(.)) {
      all(is.na(Code) | nchar(as.character(Code)) == 3)
    } else {
      TRUE
    }
)
