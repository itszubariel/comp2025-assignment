# COMP2025 Assignment — Weather in Parramatta

**Unit:** COMP2025 Introduction to Data Science (Spring 2026), Western Sydney University
**Assessment:** Project report, worth 40% of the unit, marked out of 40 across eight parts.

This repository is my submission for the COMP2025 assignment. It analyses five
years (2021–2025) of daily weather for Parramatta, NSW, downloaded from the
Open-Meteo Historical Weather API, and is written up as a report covering
exploratory analysis, multiple linear regression, classification, resampling and
error estimation, the bootstrap, and non-linear models for seasonality.

**The submitted artefact is `weather-in-parramatta.pdf`.**

## Files

| File | Purpose |
|------|---------|
| `weather-in-parramatta.Rmd` | Master document. **Knit this** to build the report. |
| `weather-in-parramatta.pdf` | Compiled report — this is the file submitted for the assignment. |
| `01-…` – `08-…` | The eight report sections, one per part of the assignment brief, pulled into the master as child documents. |
| `get-data-from-open-meteo.R` | Downloads the weather data from the Open-Meteo API. |
| `parramatta_weather.csv` | The saved daily weather data used by the report. |

## Building

Needs R with `rmarkdown`, `knitr`, `ggplot2`, `GGally`, `MASS`, `class`,
`e1071`, `splines` and `mgcv`, plus a LaTeX install (e.g. TinyTeX).

```r
rmarkdown::render("weather-in-parramatta.Rmd")
```

To re-download the data first:

```r
source("get-data-from-open-meteo.R")
```

The section files are child documents, so knit the master file rather than the
numbered files on their own.
