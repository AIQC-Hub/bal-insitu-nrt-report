# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]
### Added
- `scripts/build_summaries.R` and `scripts/dump_frames.R`, thin wrappers over
  `reportlib::build_summaries()` and `reportlib::fingerprint_frames()`.

### Changed
- Input data now comes from `ctddump` + `seastamp` instead of the R-built summaries published as
  release assets. Figures change accordingly and are not reconciled against the previous site:
  BO 86,266 profiles, CORA 155,326 profiles.
- The site is now built with **Quarto** instead of Distill. Pages are `.qmd`, `_site.yml` became
  `content/_quarto.yml`, and xaringanExtra panelsets became Quarto `::: {.panel-tabset}`.
- The shared functions and templates moved to the **`reportlib`** package. This repo now holds
  only its pages, `_func/common_site.Rmd`, its region files and `_quarto.yml`.

### Removed
- **All GL pages.** Copernicus does not provide the GL product for the Baltic Sea, and there is no
  `nrt_bo_gl` dataset in the new data. This drops `bo_gl_*` and `_func/common_bo_gl.Rmd`.
- Pressure pages and the NRT vs CORA comparison pages.
- Four sections from every summary page: "Profile level QC flags", "Location Filtering",
  "Duplicate Profiles Within Platforms" and "Duplicate Profiles Across Platforms".


## [0.4.2] - 2025-11-17
### Added
- NRT vs CORA pages

## [0.4.1] - 2025-11-15
### Fixed
- Link to the main repot site

## [0.4.0] - 2025-11-15
### Changed
- Repository name to bal-report

### Added
- Profile-level QC filtering

## [0.3.1] - 2025-11-15
### Added
- Default usage of filtering data frames in all pages
- AIQC logo to menu

## [0.3.0] - 2025-11-14
### Changed
- Removed profile no2 column

## [0.2.5] - 2025-11-12
### Changed
- Removed cached filtered dataset

### Added
- Cleaning objects at the end of pages

## [0.2.4] - 2025-11-10
### Added
- QC4 fraction section to QC pages

## [0.2.3] - 2025-11-10
### Added
- Observation data for QC1 and QC4 flags

### Changed
- Time distribution page split to two pages

## [0.2.2] - 2025-11-10
### Fixed
- Input data path for CORA

## [0.2.1] - 2025-11-10
### Added
- All pages for CORA

## [0.2.0] - 2025-11-10
### Changed
- Main input file to summary parquet

## [0.1.1] - 2025-11-06
### Added
- GitHub action to publish

## [0.1.0] - 2025-11-06
### Added
- Import Baltic Sea pages form insitu-nrt-report
