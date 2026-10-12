# COMP2025 Introduction to Data Science - Assignment (Spring 2026)
# Downloads daily historical weather data for Parramatta, NSW from the
# Open-Meteo Historical Weather API and saves it to parramatta_weather.csv.
# Run this once before knitting weather-in-parramatta.Rmd.

library(httr)
library(jsonlite)

lat <- -33.8150
lon <- 151.0011

daily_vars <- c("temperature_2m_max", "temperature_2m_min", "precipitation_sum",
                "wind_speed_10m_max", "shortwave_radiation_sum", "sunshine_duration")

resp <- GET(
  "https://archive-api.open-meteo.com/v1/archive",
  query = list(
    latitude = lat,
    longitude = lon,
    start_date = "2021-01-01",
    end_date = "2025-12-31",
    daily = paste(daily_vars, collapse = ","),
    timezone = "Australia/Sydney"
  )
)
stop_for_status(resp)

raw <- fromJSON(content(resp, as = "text", encoding = "UTF-8"))
weather <- as.data.frame(raw$daily)

write.csv(weather, "parramatta_weather.csv", row.names = FALSE)

dim(weather)
head(weather)
colSums(is.na(weather))
summary(weather)