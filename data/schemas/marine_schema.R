# Data Validation Schema for Marine Dataset
# Author: Automated validation framework
# Purpose: Define validation rules for Great Lakes fish-harvest data

library(validate)

#' Marine Data Validation Schema
#'
#' Validation rules for the ocean_data dataset (Great Lakes fish records).
#'
#' @return A validator object containing all validation rules
#' @export
marine_validation_schema <- validate::validator(
  # === Column Existence Rules ===
  "Required column: year must exist" =
    "year" %in% names(.),

  "Required column: lake must exist" =
    "lake" %in% names(.),

  "Required column: species must exist" =
    "species" %in% names(.),

  "Required column: region must exist" =
    "region" %in% names(.),

  "Required column: values must exist" =
    "values" %in% names(.),

  # === Data Type Rules ===
  "year must be numeric" =
    if ("year" %in% names(.)) is.numeric(year) else TRUE,

  "values must be numeric" =
    if ("values" %in% names(.)) is.numeric(values) else TRUE,

  "grand_total must be numeric" =
    if ("grand_total" %in% names(.)) is.numeric(grand_total) else TRUE,

  # === Value Range Rules ===
  "Year must be plausible (1800-2100)" =
    if ("year" %in% names(.)) {
      all(year >= 1800 & year <= 2100, na.rm = TRUE)
    } else {
      TRUE
    },

  "values must be non-negative" =
    if ("values" %in% names(.)) {
      all(values >= 0, na.rm = TRUE)
    } else {
      TRUE
    },

  "grand_total must be non-negative" =
    if ("grand_total" %in% names(.)) {
      all(grand_total >= 0, na.rm = TRUE)
    } else {
      TRUE
    },

  "lake must be a Great Lake" =
    if ("lake" %in% names(.)) {
      all(lake %in% c("Erie", "Huron", "Michigan", "Ontario",
                      "Superior", "Saint Clair", NA))
    } else {
      TRUE
    },

  # === Completeness Rules ===
  "year column must not have missing values" =
    if ("year" %in% names(.)) !any(is.na(year)) else TRUE,

  "lake column must not have missing values" =
    if ("lake" %in% names(.)) !any(is.na(lake)) else TRUE,

  "species column must not have missing values" =
    if ("species" %in% names(.)) !any(is.na(species)) else TRUE,

  # === Relationship Rules ===
  "values should not exceed grand_total" =
    if (all(c("values", "grand_total") %in% names(.))) {
      all(values <= grand_total | is.na(values) | is.na(grand_total))
    } else {
      TRUE
    }
)
