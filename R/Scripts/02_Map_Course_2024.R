# ------------------------------------ #
# Introduction to R                    #
# Centre Balear de Biodiversitat       #
# Tommaso Cancellario                  #
# 20 - 22 February 2024                #
# ------------------------------------ #


# Info: https://www.gbif.org/occurrence/3089958425


# Install and load pacman package
# install.packages("pacman")         
library("pacman")

# Load packages ----------------------------------------------------------------
pacman::p_load(ggplot2, sf, terra, dplyr)

# set working directory --------------------------------------------------------
setwd("~/Desktop/GitHub/Cursos/R/")
getwd()


# Load a .csv file -------------------------------------------------------------
df <- read.csv("./occurrenceData/whale_data.csv", sep = "\t")
# data.table::fread("./occurrenceData/whale_data.csv")
head(df)
str(df)

# It is recommended read some info about the species before perform analysis.
# https://es.wikipedia.org/wiki/Physeter_macrocephalus

# The attach() method is used to access variables of a data frame without 
# invoking any function or method.

attach(df)
kingdom # If we want to see the kingdom column
unique(kingdom) # Unique values

detach(df)
kingdom # Try it...

df$kingdom
unique(df$kingdom)

# Count number of column and rows
ncol(df)
nrow(df)

# Check the year of the sampling campaign
unique(df$year)
sort(unique(df$year)) # Increasing
sort(unique(df$year), decreasing = TRUE) # Decreasing

# How many record x year?

# Check before if in the year columns there are NA values
which(is.na(df$year))

# Count the number of records 
table(df$year)
barplot(table(df$year))

# Check the taxonomy integrity of our data frame -------------------------------

# We are working with 1 species. We want to verify if the taxonomy is unique for
# the whole data frame.

colnames(df)

unique(df$kingdom)
unique(df$phylum)
unique(df$class)
unique(df$order)
unique(df$family)
unique(df$genus)
unique(df$species)
unique(df$taxonRank)

unique(df[c(4:10, 12)])

# We can try to change a row of df breaking the integrity.
df.1 <- df
df.1$taxonRank[nrow(df.1)] <- "SUBSPECIES"

unique(df.1[c(4:10, 12)])

# Remove the df.1
rm(df.1)
# rm(list = ls())

# Where the whale has been found?
unique(df$countryCode)

# Distribution
plot(df$decimalLongitude, df$decimalLatitude, pch = 20, 
     main = "Physeter macrocephalus gis points", 
     xlab = "Longitude", ylab = "Latitude")


# Load raster file -------------------------------------------------------------

# Downloaded from: https://www.gebco.net/data_and_products/gridded_bathymetry_data/

# GEBCO’s current gridded bathymetric data set, the GEBCO_2023 Grid, is a global 
# terrain model for ocean and land, providing elevation data, in meters, 
# on a 15 arc-second interval grid.

# At 0° latitude: 15 arc-second <- ~ 463 m

balearic_bat <- rast("./geoData/GEBCO_06_Feb_2024_4cba6c55638e/gebco_2023.tif")
balearic_bat

# Change raster name
names(balearic_bat) <- "bathymetry"
balearic_bat

# Plot the raster file
plot(balearic_bat)
points(df$decimalLongitude, df$decimalLatitude, pch = 20)
abline(v = c(0, 5), h = c(38, 41), col = c(rep("blue", 2), rep("red", 2)))

# (length=4; order=xmin, xmax, ymin, ymax)
e <- ext(0, 5, 38, 41)
balearic_bat.crop <- crop(balearic_bat, e)

# plot(balearic_bat.crop, col = viridis::viridis_pal(option = "D")(10))
plot(balearic_bat.crop, col = viridis::viridis_pal(option = "D")(100))
points(df$decimalLongitude, df$decimalLatitude, pch = 20)

# Load .shp file for balearic islands
balearic_shp <- st_read("./geoData/Balearic_Islands/Balearic_4326_simplified.shp")

# Plot shp file
pdf("./Balearic_GIS.pdf", paper = "a4") # Save PDF
plot(balearic_shp[7])
dev.off()

pdf("./Balearic_GIS_2.pdf", paper = "a4r") # Save PDF with rotation
plot(balearic_shp[7])
dev.off()


# Plot bathimetry + Blaearic Islands
plot(balearic_bat.crop)
# plot(balearic_bat.crop, col = viridis::viridis_pal(option = "D")(100)) 
plot(balearic_shp[7], add = TRUE)
points(df$decimalLongitude, df$decimalLatitude, pch = 20)

# Extraction of depth for each records
depth <- data.frame(extract(x = balearic_bat, 
                            y = df[ ,c("decimalLongitude","decimalLatitude")])) 

hist(depth$bathymetry)

depth.kd <- density(depth$bathymetry, na.rm = TRUE)
plot(depth.kd, col = "green")

ggplot() +
  geom_density(aes(x = depth$bathymetry), fill = "green", alpha = 0.5) + 
  xlab("Bathymetry") +
  theme_bw()

# What are the challenges when working with marine species and bathymetry data?


#-----------------#
# Add one species --------------------------------------------------------------
#-----------------#

# Load a .csv file -------------------------------------------------------------
df1 <- read.csv("./occurrenceData/Caretta_caretta.csv", sep = "\t")
head(df1)
str(df1)

# Count number of column and rows
ncol(df1)
nrow(df1)

# Check the year of the sampling campaign
sort(unique(df1$year)) # Increasing

# Check before if in the year columns there are NA values
length(which(is.na(df1$year)))

# Count the number of records 
barplot(table(df1$year), las = 2)

# We can remove the data without the year
df2 <- df1[!is.na(df1$year), ]

nrow(df1) - nrow(df2)

rm(df1)

# Check taxonomy
unique(df2[c(4:10, 12)])

# Plot occurrences
plot(balearic_bat.crop)
plot(balearic_shp[7], add = TRUE)
points(df2$decimalLongitude, df2$decimalLatitude, pch = 20)


# Extraction of depth for each records
depth2 <- data.frame(extract(x = balearic_bat, 
                            y = df2[ ,c("decimalLongitude","decimalLatitude")])) 

hist(depth2$bathymetry)

depth.kd <- density(depth2$bathymetry, na.rm = TRUE)
plot(depth.kd, col = "blue")

ggplot() +
  geom_density(aes(x = depth2$bathymetry), fill = "blue", alpha = 0.5) + 
  theme_bw()


# Plot both taxa
plot(balearic_bat.crop)
plot(balearic_shp[1], add = TRUE)
points(df$decimalLongitude, df$decimalLatitude, pch = 20, col = "red")
points(df2$decimalLongitude, df2$decimalLatitude, pch = 20, col = "blue")


# Depth for both taxa
ggplot() +
  geom_density(aes(x = depth$bathymetry), fill = "green", alpha = 0.5) + 
  geom_density(aes(x = depth2$bathymetry), fill = "blue", alpha = 0.5) + 
  theme_bw()


#---------------------#
# Add one species more ---------------------------------------------------------
#---------------------#

# Load a .csv file -------------------------------------------------------------
df3 <- read.csv("./occurrenceData/Podarcis.csv", sep = "\t")
head(df3)
str(df3)

# Count number of column and rows
ncol(df3)
nrow(df3)

# Check the year of the sampling campaign
sort(unique(df3$year)) # Increasing

# Check before if in the year columns there are NA values
length(which(is.na(df3$year)))

# !!!! In this case we have records without year information
# We can remove these data
df3 <- df3[!is.na(df3$year), ]
length(which(is.na(df3$year)))

# Count the number of records 
barplot(table(df3$year), las = 2)

# Check taxonomy
unique(df3[c(4:10, 12)])

# We want only the occurrence at species level
df3 <- df3[df3$taxonRank == "SPECIES", ]
unique(df3[c(4:10, 12)])


# Plot occurrences
plot(balearic_bat.crop)
plot(balearic_shp[7], add = TRUE)
points(df3$decimalLongitude, df3$decimalLatitude, pch = 20, cex = 0.6)


# OPS.... we have a problem

# (length=4; order=xmin, xmax, ymin, ymax)
e.pit <- ext(1, 2, 38.5, 39.5)
balearic_bat.pit <- crop(balearic_bat, e.pit)

plot(balearic_bat.pit)
plot(balearic_shp[7], add = TRUE)
points(df3$decimalLongitude, df3$decimalLatitude, pch = 20, cex = 0.6)


# We need to remove the sea-records 
# To do that we can mask the bathymetry to extract only the elevation
elevation <- mask(balearic_bat.crop, balearic_shp)
plot(elevation)

podarcis.elev <- data.frame(extract(x = elevation, 
                                    y = df3[ ,c("decimalLongitude","decimalLatitude")])) 
head(podarcis.elev)

# NA values are those that fall into the sea.
length(which(is.na(podarcis.elev$bathymetry)))

# Add the elevation information in the main dataset
df3$elevationRaster <- podarcis.elev$bathymetry
head(df3)

# We can filter and remove the records containing NA values into the column elevationRaster
df3 <- df3[!is.na(df3$elevationRaster), ]

plot(balearic_bat.crop)
plot(balearic_shp[7], add = TRUE)
points(df3$decimalLongitude, df3$decimalLatitude, pch = 20, cex = 0.6)

# Remove record from Menorca

plot(balearic_bat.crop)
plot(balearic_shp[7], add = TRUE)
points(df3$decimalLongitude, df3$decimalLatitude, pch = 20, cex = 0.6)
abline(v = 4.08, h = 39.92, col = c("blue", "red"))
abline(v = 3.98, h = 39.98, col = c("purple", "orange"))


df3 <- df3[df3$decimalLongitude != 4.068106, ]
df3 <- df3[df3$decimalLongitude != 3.981433, ]
df3 <- df3[df3$decimalLongitude != 3.981236, ]


plot(balearic_bat.crop)
plot(balearic_shp[7], add = TRUE)
points(df3$decimalLongitude, df3$decimalLatitude, pch = 20, cex = 0.6)


# Plot taxa
plot(balearic_bat.crop)
plot(balearic_shp[7], add = TRUE)
points(df$decimalLongitude, df$decimalLatitude, pch = 20, col = "red", cex = 0.5)
points(df2$decimalLongitude, df2$decimalLatitude, pch = 20, col = "blue", cex = 0.5)
points(df3$decimalLongitude, df3$decimalLatitude, pch = 20, col = "purple", cex = 0.5)


# Depth/elevation taxa
ggplot() +
  geom_density(aes(x = depth$bathymetry), fill = "green", alpha = 0.5) + 
  geom_density(aes(x = depth2$bathymetry), fill = "blue", alpha = 0.5) + 
  geom_density(aes(x = df3$elevationRaster), fill = "purple", alpha = 0.5) + 
  theme_bw()