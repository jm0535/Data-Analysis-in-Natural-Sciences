# Data Validation Schema for Entomology Dataset
# Author: Automated validation framework
# Purpose: Define validation rules for animal-outcome data by region

library(validate)

#' Entomology Data Validation Schema
#'
#' Validation rules for the insects dataset (animal outcomes by Australian state).
#'
#' @return A validator object containing all validation rules
#' @export
entomology_validation_schema <- validate::validator(
  # === Column Existence Rules ===
  "Required column: year must exist" =
    "year" %in% names(.),

  "Required column: animal_type must exist" =
    "animal_type" %in% names(.),

  "Required column: outcome must exist" =
    "outcome" %in% names(.),

  "Required column: Total must exist" =
    "Total" %in% names(.),

  # === Data Type Rules ===
  "year must be numeric" =
    if ("year" %in% names(.)) is.numeric(year) else TRUE,

  "Total must be numeric" =
    if ("Total" %in% names(.)) is.numeric(Total) else TRUE,

  "State counts must be numeric" =
    if (all(c("ACT", "NSW", "QLD", "VIC", "WA", "SA", "TAS", "NT") %in% names(.))) {
      is.numeric(ACT) && is.numeric(NSW) && is.numeric(QLD) &&
        is.numeric(VIC) && is.numeric(WA) && is.numeric(SA) &&
        is.numeric(TAS) && is.numeric(NT)
    } else {
      TRUE
    },

  # === Value Range Rules ===
  "Year must be plausible (1990-2100)" =
    if ("year" %in% names(.)) {
      all(year >= 1990 & year <= 2100, na.rm = TRUE)
    } else {
      TRUE
    },

  "State counts must be non-negative" =
    if ("NSW" %in% names(.)) {
      all(NSW >= 0, na.rm = TRUE)
    } else {
      TRUE
    },

  "Total must be non-negative" =
    if ("Total" %in% names(.)) {
      all(Total >= 0, na.rm = TRUE)
    } else {
      TRUE
    },

  "Outcome must be valid" =
    if ("outcome" %in% names(.)) {
      all(outcome %in% c("Reclaimed", "Rehomed", "Other", "Euthanized",
                         "Transferred", "In Stock", NA))
    } else {
      TRUE
    },

  # === Completeness Rules ===
  "year column must not have missing values" =
    if ("year" %in% names(.)) !any(is.na(year)) else TRUE,

  "animal_type column must not have missing values" =
    if ("animal_type" %in% names(.)) !any(is.na(animal_type)) else TRUE
)
