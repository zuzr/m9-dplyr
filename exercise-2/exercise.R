# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
#install.packages('devtools')

# Install "fueleconomy" package from GitHub
#devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the `vehicles` data.frame
data("vehicles")

# Create a data.frame of vehicles from 1997
v1997 <- filter(vehicles, year == 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
v1997.works <- unique(v1997$year) == 1997

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
v2wd.20mpg <- filter(vehicles, drive == "2-Wheel Drive" & cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.mpg <- summarise(v2wd.20mpg, min = min(hwy))

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MostHwy <- function(thisYear, thisMake) {
  param <- filter(vehicles, year == thisYear & make == thisMake)
  return(summarise(param, max = max(hwy)))
}

# What was the most efficient honda model of 1995?
MostHwy(1995, "Honda")

