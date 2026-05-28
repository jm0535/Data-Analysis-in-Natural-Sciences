# Data Validation Schema for Ecology Dataset
# Author: Automated validation framework
# Purpose: Define validation rules for biodiversity / extinct species data

library(validate)

#' Ecology Data Validation Schema
#'
#' Validation rules for biodiversity dataset of extinct/threatened species.
#'
#' @return A validator object containing all validation rules
#' @export
ecology_validation_schema <- validate::validator(
  # === Column Existence Rules ===
  "Required column: binomial_name must exist" =
    "binomial_name" %in% names(.),

  "Required column: country must exist" =
    "country" %in% names(.),

  "Required column: continent must exist" =
    "continent" %in% names(.),

  "Required column: red_list_category must exist" =
    "red_list_category" %in% names(.),

  # === Data Type Rules ===
  "binomial_name must be character" =
    if ("binomial_name" %in% names(.)) is.character(binomial_name) else TRUE,

  "Threat flags must be 0 or 1" =
    if ("threat_AA" %in% names(.)) {
      all(threat_AA %in% c(0, 1, NA))
    } else {
      TRUE
    },

  "Action flags must be 0 or 1" =
    if ("action_LWP" %in% names(.)) {
      all(action_LWP %in% c(0, 1, NA))
    } else {
      TRUE
    },

  # === Value Range Rules ===
  "Continent must be valid" =
    if ("continent" %in% names(.)) {
      all(continent %in% c("Africa", "Asia", "Europe", "North America",
                           "South America", "Oceania", "Antarctica", NA))
    } else {
      TRUE
    },

  "Red list category must be valid" =
    if ("red_list_category" %in% names(.)) {
      all(red_list_category %in% c("Extinct", "Extinct in the Wild",
                                    "Critically Endangered", "Endangered",
                                    "Vulnerable", "Near Threatened",
                                    "Least Concern", "Data Deficient", NA))
    } else {
      TRUE
    },

  # === Completeness Rules ===
  "binomial_name column must not have missing values" =
    if ("binomial_name" %in% names(.)) !any(is.na(binomial_name)) else TRUE,

  "country column must not have missing values" =
    if ("country" %in% names(.)) !any(is.na(country)) else TRUE,

  "At least 80% of records must be complete" =
    sum(complete.cases(.)) / nrow(.) >= 0.8
)
