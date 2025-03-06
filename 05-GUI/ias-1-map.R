box::use(
  dplyr[mutate],
  bslib,
  leaflet,
  stringr[str_detect],
  stars[st_warp, read_stars],
  sf[st_crs],
  terra[rast, minmax],
  shiny,
)

# Define the base URL for the OPeNDAP server
base_url <- "http://opendap.biodt.eu/ias-pdt/predictions"

# Load the Predictions_Summary.RData from the OPeNDAP server
if (!exists("Predictions_Summary")) {
  load(url(paste0(base_url, "/Predictions_Summary.RData")))
}
predictions_summary <- Predictions_Summary

# Update the paths to point to the remote OPeNDAP files
predictions_summary <- predictions_summary |>
  mutate(
    tif_path = paste0(base_url, "/", tif_path_mean)
  )

raster_data <- read_stars(predictions_summary$tif_path[1])
# Warp the raster to a regular grid using st_warp()
raster_data_regular <- st_warp(raster_data, crs = st_crs(3857))
# Convert the stars object to RasterLayer
raster_data_raster <- rast(raster_data_regular)

pal <- leaflet$colorNumeric(
  "plasma",
   domain = minmax(raster_data_raster),
    na.color = "transparent")

ias_app_ui <-
  bslib$page_fluid(
    bslib$card(
      height = 650,
      bslib$card_body(leaflet$leafletOutput("rasterMap"))
    )
  )

ias_app_server <- function(input, output, session) {

  # Render the base Leaflet map only once
  output$rasterMap <- leaflet$renderLeaflet({
    leaflet$leaflet() |>
      leaflet$addTiles() |>
        leaflet$setView(lng = 10, lat = 50, zoom = 4) |>
          addRasterImage(
            raster_data_raster,
            colors = pal
          )
  })
}

shinyApp(ui = ias_app_ui, server = ias_app_server)
