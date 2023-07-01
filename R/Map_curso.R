# Install and load pacman package
# install.packages("pacman")         
library("pacman")   

# Load packages
p_load(sf, terra, dplyr, spData, spDataLarge, tmap, grid)  

# set working directory
setwd("./Desktop/")

# Load DEM raster for balearic islands
balearic_elev <- rast("./elevation_balearic.tif")
plot(balearic_elev)

# Load .shp file for balearic islands
balearic_shp <- st_read("./gadm41_ESP_shp 2/balearic_1.shp")

# Add fill layer to balearic shape
tm_shape(balearic_shp) +
  tm_fill() +
  tm_layout(title = "Balearic Islands")
# Add border layer to balearic shape
tm_shape(balearic_shp) +
  tm_borders() +
  tm_layout(title = "Balearic Islands")
# Add fill and border layers to balearic shape
tm_shape(balearic_shp) +
  tm_fill() +
  tm_borders() +
  tm_layout(title = "Balearic Islands",
            bg.color = "lightblue") +
tm_compass(type = "8star", position = c("left", "top")) +
  tm_scale_bar(breaks = c(0, 20, 40), text.size = 1)



# Map 1
map_bi = tm_shape(balearic_shp) + tm_polygons()
map_bi

# Map 2
map_bi2 = map_bi +
  tm_shape(balearic_elev) + tm_raster(alpha = 0.7) +
  tm_layout(legend.position = c("left", "top"),
    title = "Balearic Islands",
    bg.color = "lightblue")
map_bi2


# Create random spcies distribution
set.seed(16)
sp1 <- st_sample(balearic_shp, size = 100, type = "random")

set.seed(4)
sp2 <- st_sample(balearic_shp, size = 100, type = "random")

# Map 3
map_bi3 = map_bi2 +
  tm_shape(sp1) + tm_dots(col = "blue")
map_bi3

# Map 4
map_bi4 = map_bi2 +
  tm_shape(sp2) + tm_dots(col = "red")
map_bi4

# Map 5
map_bi5 = map_bi2 +
  tm_shape(sp1) + tm_dots(col = "blue") +
  tm_shape(sp2) + tm_dots(col = "red")
map_bi5


# Zoom map
bi_region = st_bbox(c(xmin = 1.0930, xmax = 1.8000,
                      ymin = 38.5720, ymax = 39.2251),
                    crs = st_crs(sp1)) |> 
  st_as_sfc()

bi_height_map = tm_shape(balearic_elev, bbox = bi_region) +
  tm_raster(style = "cont", palette = "YlGn", legend.show = TRUE) +
  tm_shape(sp1) + tm_symbols(shape = 19, col = "blue", size = 0.1) +
  tm_shape(sp2) + tm_symbols(shape = 8, col = "red", size = 0.1) +
  tm_scale_bar(position = c("left", "bottom"))
bi_height_map

# Zoom and small map
bi_map = tm_shape(balearic_shp) + tm_polygons() +
  tm_shape(sp1) + tm_symbols(shape = 19, col = "blue", size = 0.01) +
  tm_shape(sp2) + tm_symbols(shape = 8, col = "red", size = 0.01) +
  tm_shape(bi_region) + tm_borders(lwd = 3) 


bi_height_map
print(bi_map, vp = viewport(0.67, 0.9, width = 0.2, height = 0.2))