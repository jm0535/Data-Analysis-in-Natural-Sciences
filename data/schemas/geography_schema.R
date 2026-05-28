# Data Validation Schema for Geography Dataset
# Author: Automated validation framework
# Purpose: Define validation rules for spatial hurricane-track data

library(validate)

#' Geography Data Validation Schema
#'
#' Validation rules for the spatial dataset (hurricane track points).
#'
#' @return A validator object containing all validation rules
#' @export
geography_validation_schema <- validate::validator(
  # === Column Existence Rules ===
  "Required column: name must exist" =
    "name" %in% names(.),

  "Required column: year must exist" =
    "year" %in% names(.),

  "Required column: lat must exist" =
    "lat" %in% names(.),

  "Required column: long must exist" =
    "long" %in% names(.),

  # === Data Type Rules ===
  "lat must be numeric" =
    if ("lat" %in% names(.)) is.numeric(lat) else TRUE,

  "long must be numeric" =
    if ("long" %in% names(.)) is.numeric(long) else TRUE,

  "wind must be numeric" =
    if ("wind" %in% names(.)) is.numeric(wind) else TRUE,

  "pressure must be numeric" =
    if ("pressure" %in% names(.)) is.numeric(pressure) else TRUE,

  # === Value Range Rules ===
  "Latitude must be in [-90, 90]" =
    if ("lat" %in% names(.)) {
      all(lat >= -90 & lat <= 90, na.rm = TRUE)
    } else {
      TRUE
    },

  "Longitude must be in [-180, 180]" =
    if ("long" %in% names(.)) {
      all(long >= -180 & long <= 180, na.rm = TRUE)
    } else {
      TRUE
    },

  "Month must be in [1, 12]" =
    if ("month" %in% names(.)) {
      all(month >= 1 & month <= 12, na.rm = TRUE)
    } else {
      TRUE
    },

  "Day must be in [1, 31]" =
    if ("day" %in% names(.)) {
      all(day >= 1 & day <= 31, na.rm = TRUE)
    } else {
      TRUE
    },

  "Hour must be in [0, 23]" =
    if ("hour" %in% names(.)) {
      all(hour >= 0 & hour <= 23, na.rm = TRUE)
    } else {
      TRUE
    },

  "Wind must be non-negative and realistic (< 250 kt)" =
    if ("wind" %in% names(.)) {
      all(wind >= 0 & wind < 250, na.rm = TRUE)
    } else {
      TRUE
    },

  "Pressure must be in plausible mbar range (800-1100)" =
    if ("pressure" %in% names(.)) {
      all(pressure >= 800 & pressure <= 1100, na.rm = TRUE)
    } else {
      TRUE
    },

  # === Completeness Rules ===
  "name column must not have missing values" =
    if ("name" %in% names(.)) !any(is.na(name)) else TRUE
)
