# Data Validation Schema for Epidemiology Dataset
# Author: Automated validation framework
# Purpose: Define validation rules for medicinal/disease data

library(validate)

#' Epidemiology Data Validation Schema
#'
#' Validation rules for the disease_data dataset (EMA medicine authorisations).
#'
#' @return A validator object containing all validation rules
#' @export
epidemiology_validation_schema <- validate::validator(
  # === Column Existence Rules ===
  "Required column: category must exist" =
    "category" %in% names(.),

  "Required column: medicine_name must exist" =
    "medicine_name" %in% names(.),

  "Required column: authorisation_status must exist" =
    "authorisation_status" %in% names(.),

  # === Data Type Rules ===
  "medicine_name must be character" =
    if ("medicine_name" %in% names(.)) is.character(medicine_name) else TRUE,

  "patient_safety must be logical" =
    if ("patient_safety" %in% names(.)) is.logical(patient_safety) else TRUE,

  "generic must be logical" =
    if ("generic" %in% names(.)) is.logical(generic) else TRUE,

  "orphan_medicine must be logical" =
    if ("orphan_medicine" %in% names(.)) is.logical(orphan_medicine) else TRUE,

  "revision_number must be numeric" =
    if ("revision_number" %in% names(.)) is.numeric(revision_number) else TRUE,

  # === Value Range Rules ===
  "category must be human or veterinary" =
    if ("category" %in% names(.)) {
      all(category %in% c("human", "veterinary", NA))
    } else {
      TRUE
    },

  "authorisation_status must be valid" =
    if ("authorisation_status" %in% names(.)) {
      all(authorisation_status %in% c("authorised", "withdrawn", "refused",
                                       "suspended", "pending", NA))
    } else {
      TRUE
    },

  "revision_number must be non-negative" =
    if ("revision_number" %in% names(.)) {
      all(revision_number >= 0, na.rm = TRUE)
    } else {
      TRUE
    },

  "URL must look like a URL when present" =
    if ("url" %in% names(.)) {
      all(is.na(url) | grepl("^https?://", url))
    } else {
      TRUE
    },

  # === Completeness Rules ===
  "medicine_name column must not have missing values" =
    if ("medicine_name" %in% names(.)) !any(is.na(medicine_name)) else TRUE,

  "category column must not have missing values" =
    if ("category" %in% names(.)) !any(is.na(category)) else TRUE
)
