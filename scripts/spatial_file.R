# Load the sf package
library(sf)
# Read in the trees shapefile
paises <- st_read("data/paises.shp")
# View the first few paises
head(paises)


# Load the raster package
library(raster)
# Read in the tree l8_b4 single-band raster
l8_b4 <- raster("data/landsat8_test_b4.tiff")
# Identify how many layers each object has
nlayers(l8_b4)
# Read in the manhattan Landsat image multi-band raster
st <- stack(
  "data/rs/LC08_044034_20170614_B4.tif",
  "data/rs/LC08_044034_20170614_B3.tif",
  "data/rs/LC08_044034_20170614_B2.tif"
)
class(st)
nlayers(st)
plotRGB(st, stretch="lin")




# Coordinate system
# Determine the CRS for the countries
st_crs(paises)
# Assign the CRS to trees
crs_1 <- "+proj=longlat +ellps=WGS84 +no_defs"
st_crs(paises) <- crs_1
# Determine the CRS for the canopy and paises rasters
crs(paises)
# Assign the CRS to paises
crs_2 <- "+proj=utm +zone=10 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0"
crs(st) <- crs_2


# Transform to a common CRS
# Get the CRS from the l8_b4 object
the_crs <- crs(l8_b4, asText = TRUE)
# Project paises to match the CRS of l8_b4
paises_crs <- st_transform(paises, crs = the_crs)
# Project paises to match the CRS of canopy
landsat_crs <- projectRaster(st, crs = the_crs, method = "ngb")


# Look at the CRS to see if they match
st_crs(paises_crs)
crs(landsat_crs)


# Leyendo data de distritos y covid
distritos <- st_read("data/distritos.shp")
covid <- st_read("data/covid.shp")
dem <- raster("data/dem.tif")
puntos = st_read("data/punto_prueba.shp")
# dem_clip <- mask(crop(dem, distritos[32,]), distritos[32,])
# plot(dem_clip)
# dem_18s <- projectRaster(dem_clip, crs = "+proj=utm +zone=18 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
# dem_18s <- dem_clip

# Starting in tmap
library(tmap)
tmap_mode("plot")
tm_shape(dem) + 
  tm_raster() + 
  tm_shape(distritos) + 
  tm_polygons(alpha = 0.5) +
  tm_shape(puntos)+
  tm_bubbles("value",
             col ="#338BFF"
             )+
  tm_graticules(labels.cardinal = TRUE,
                labels.rot=c(90,0)) +
  tm_layout(main.title = "Titulo",
            main.title.position = "center",
            main.title.color = "blue",
            title.color = "red",
            legend.outside=TRUE,
            # legend.outside.position = c("left","bottom"),
            legend.outside.position = "bottom",
            legend.bg.color = "white") +
  tm_scale_bar(position=c("right", "bottom"))+
  tm_compass(type="4star", position=c("RIGHT", "top"), 
             show.labels = 2, size=2.5, text.size = 0.6)
  # tm_add_legend(
  #   type = c("fill", "symbol", "text", "line"),
  #   labels = NULL,
  #   col = NULL,
  #   size = NULL,
  #   shape = NULL,
  #   lwd = NULL,
  #   lty = NULL,
  #   text = NULL,
  #   alpha = NA,
  #   border.col = "black",
  #   border.lwd = 1,
  #   border.alpha = NA,
  #   title = "prueba",
  #   is.portrait = TRUE,
  #   legend.format = list(),
  #   reverse = FALSE,
  #   z = NA,
  #   group = NULL
  # )


# Starting in rayshader
# library(rayshader)
# 
# elev_matrix <- matrix(
#   raster::extract(dem_clip, raster::extent(dem_clip), buffer = 1000), 
#   nrow = ncol(dem_clip), ncol = nrow(dem_clip)
# )
# 
# elev_matrix %>%
#   sphere_shade() %>%
#   add_water(detect_water(elev_matrix)) %>%
#   add_shadow(ray_shade(elev_matrix)) %>%
#   add_shadow(ambient_shade(elev_matrix)) %>%
#   plot_3d(elev_matrix)
