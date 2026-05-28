# renv.lock Audit

Audit date: 2026-05-29. Sampled 39 of the 304 locked packages against
current CRAN versions via `crandb.r-pkg.org`. Focus: tidyverse,
tidymodels, modeling, geospatial, and core infrastructure.

## High drift (review candidates)

| Package | Locked | Latest CRAN | Drift |
|---|---|---|---|
| lme4 | 1.1-38 | 2.0-1 | **major** — API changes possible |
| renv | 1.0.10 | 1.2.3 | minor — newer cache/lockfile format |
| parsnip | 1.4.0 | 1.6.0 | minor — engine additions |
| tune | 2.0.1 | 2.1.0 | minor |
| yardstick | 1.3.2 | 1.4.0 | minor |
| dplyr | 1.1.4 | 1.2.1 | minor |
| tidymodels | 1.4.1 | 1.5.0 | minor |
| broom | 1.0.10 | 1.0.13 | patch |
| shiny | 1.11.1 | 1.13.0 | minor |
| terra | 1.8-86 | 1.9-27 | minor — geospatial back-end |
| sf | 1.0-23 | 1.1-1 | minor |
| plotly | 4.11.0 | 4.12.0 | minor |
| vctrs | 0.6.5 | 0.7.3 | minor — internal vector ops |
| rlang | 1.1.6 | 1.2.0 | minor |

## In sync

`tidyverse`, `tidyr`, `ggplot2`, `purrr`, `tibble`, `stringr`, `forcats`,
`lubridate`, `rsample`, `recipes`, `workflows`, `raster`, `leaflet`,
`magrittr`, `glue`, `cli`, `nlme`, `MASS`, `sp` — all within 1 patch of
current.

## Recommended action

1. **lme4** — major version bump (1.x → 2.x). Check release notes before
   updating; any mixed-models chapters relying on `lmer()` should be
   re-rendered after upgrade to catch behaviour changes.
2. **renv** — update locally with `renv::upgrade()`. Newer lockfile
   format is backwards-compatible.
3. **tidymodels stack** (parsnip, tune, yardstick) — safe minor bumps;
   `tune::tune_grid()` gained better progress reporting in 2.1.
4. **terra / sf** — minor bumps; rerun chapter 10 (conservation/spatial)
   afterwards to verify no breaking changes in raster math.

To apply selectively:

```r
renv::update(c("dplyr", "renv", "tidymodels", "parsnip", "tune",
               "yardstick", "broom", "terra", "sf"))
# Then rebuild book to catch any breakages
quarto render
```

## CVE notes

No automated CVE check was performed in this audit (no R-specific CVE
feed available via simple HTTP). For a deeper check, run:

```r
# Optional: requires `pak`
pak::pkg_deps_tree(".") |> dplyr::distinct(package)
# Then cross-reference with https://github.com/advisories?query=ecosystem%3Acran
```

Package drift sampled, not exhaustive. Run `renv::status()` locally for
the full 304-package picture.
