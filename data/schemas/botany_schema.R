# Data Validation Schema for Botany Dataset
# Author: Automated validation framework
# Purpose: Define validation rules for plant/plastic-waste trait data

library(validate)

#' Botany Data Validation Schema
#'
#' Validation rules for the plant_traits dataset (plastic waste by parent company).
#'
#' @return A validator object containing all validation rules
#' @export
botany_validation_schema <- validate::validator(
  # === Column Existence Rules ===
  "Required column: country must exist" =
    "country" %in% names(.),

  "Required column: year must exist" =
    "year" %in% names(.),

  "Required column: parent_company must exist" =
    "parent_company" %in% names(.),

  "Required column: grand_total must exist" =
    "grand_total" %in% names(.),

  # === Data Type Rules ===
  "Year must be numeric" =
    if ("year" %in% names(.)) is.numeric(year) else TRUE,

  "Grand total must be numeric" =
    if ("grand_total" %in% names(.)) is.numeric(grand_total) else TRUE,

  "Plastic type counts must be numeric" =
    if (all(c("hdpe", "ldpe", "pet", "pp", "ps", "pvc") %in% names(.))) {
      is.numeric(hdpe) && is.numeric(ldpe) && is.numeric(pet) &&
        is.numeric(pp) && is.numeric(ps) && is.numeric(pvc)
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

  "Grand total must be non-negative" =
    if ("grand_total" %in% names(.)) {
      all(grand_total >= 0, na.rm = TRUE)
    } else {
      TRUE
    },

  "Number of events must be non-negative" =
    if ("num_events" %in% names(.)) {
      all(num_events >= 0, na.rm = TRUE)
    } else {
      TRUE
    },

  "Volunteers count must be non-negative" =
    if ("volunteers" %in% names(.)) {
      all(volunteers >= 0, na.rm = TRUE)
    } else {
      TRUE
    },

  # === Completeness Rules ===
  "country column must not have missing values" =
    if ("country" %in% names(.)) !any(is.na(country)) else TRUE,

  "parent_company column must not have missing values" =
    if ("parent_company" %in% names(.)) !any(is.na(parent_company)) else TRUE,

  "At least 80% of records must be complete" =
    sum(complete.cases(.)) / nrow(.) >= 0.8
)
