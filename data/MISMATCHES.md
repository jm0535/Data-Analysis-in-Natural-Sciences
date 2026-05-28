# Dataset Filename / Content Mismatches

Audit date: 2026-05-29. Several CSVs in `data/` have filenames that do not
describe their actual contents (apparently sourced from TidyTuesday and
similar projects without renaming). Files are referenced from chapter
.qmd files under those names, so renaming would break the book; this
document records the truth so future schemas, exercises, and discussions
stay grounded.

## Mismatches

| File | Filename implies | Actual content |
|---|---|---|
| `botany/plant_traits.csv` | Plant trait measurements | **Plastic-waste audit data** (parent_company, polymer types HDPE/LDPE/PET/PP/PS/PVC, num_events, volunteers) |
| `entomology/insects.csv` | Insect counts/traits | **Australian animal-shelter outcomes** (year, animal_type, outcome, per-state counts ACT/NSW/NT/QLD/SA/TAS/VIC/WA) |
| `environmental/climate_data.csv` | Climate/weather measurements | **Palmer Penguins** (species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, year) |
| `epidemiology/disease_data.csv` | Disease incidence/cases | **Atlantic hurricane tracks** (name, lat, long, wind, pressure, storm category) |
| `forestry/forest_inventory.csv` | Tree measurements / DBH | **Star Wars characters** (name, height, mass, hair_color, homeworld, species, films) |
| `geography/spatial.csv` | Geographic / spatial data | **EMA medicine authorisations** (medicine_name, therapeutic_area, atc_code, authorisation_status) |
| `marine/ocean_data.csv` | Oceanographic measurements | **Great Lakes fish populations** (year, lake, species, region, values) |

## Files that match their names

- `agriculture/crop_yields.csv` ✅ — country-year crop yields (Wheat/Rice/Maize/etc., tonnes/ha)
- `economics/economic.csv` ✅ — coffee quality scores with economic columns (price, altitude, certifications) — domain stretch but defensible
- `ecology/biodiversity.csv` ✅ — IUCN red-list species records with threat codes and conservation actions

## Impact on the book

The chapter exercises and code chunks were written assuming these
*topical* filenames map to topical content. They don't. Examples:

- ch 04 Exercise 1 asks students to t-test "tree measurements" from
  `forestry/forest_inventory.csv` — but the file is Star Wars characters.
  The exercise still works mechanically (you can compare `height` between
  two `species`), but the framing is misleading.
- ch 04 Exercise 5 asks for a CI on `temperature` in
  `environmental/climate_data.csv` — but there is no temperature column;
  the file is penguin morphology.
- ch 05 Exercise 6 uses `entomology/insects.csv` for a two-group test —
  the columns are state-level shelter counts, not insect data.

## Schemas

The per-dataset validators in `data/schemas/*.R` were written against the
**actual** column names in each CSV, not the implied topical names. They
correctly validate the data on disk. Adjust the chapter prose / exercise
framing instead of renaming files.

## Recommended remediation (not done in this audit)

1. **Short-term:** rewrite chapter exercise prompts that lean on the
   topical framing (ch 04 Ex 1, 5; ch 05 Ex 6) to match the actual
   columns. The mechanics of each test still apply.
2. **Medium-term:** source genuine domain-matching CSVs for botany,
   entomology, environmental, epidemiology, forestry, geography, marine.
   The fake filenames hurt credibility for a textbook.
3. **Until then:** when introducing each dataset in a chapter, add a
   one-sentence note: "This dataset uses [topic] as a vehicle for
   demonstrating the technique; the columns are [...]."
