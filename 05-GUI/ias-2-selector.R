box::use(
  dplyr[mutate, filter, slice, pull],
  bslib,
  leaflet,
  stringr[str_detect],
  stars[st_warp, read_stars],
  sf[st_crs],
  terra[rast, minmax],
  shiny,
)

box::use(
  `05-GUI`/logic/helper[process_raster_file],
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



ias_app_ui <-
  bslib$page_fluid(
    bslib$card(
      height = 650,
      shiny$selectInput(
        inputId = "climate_model",
        label = "Climate Model",
        choices = c(
          "Current",
          "GFDL-ESM4",
          "IPSL-CM6A-LR",
          "MPI-ESM1-2-HR",
          "MRI-ESM2-0",
          "UKESM1-0-LL",
          "Ensemble")
      ),
      bslib$card_body(leaflet$leafletOutput("rasterMap"))
    )
  )

ias_app_server <- function(input, output, session) {

  # Render the base Leaflet map only once
  output$rasterMap <- leaflet$renderLeaflet({
    leaflet$leaflet() |>
      leaflet$addTiles() |>
        leaflet$setView(lng = 10, lat = 50, zoom = 4)
  })

  shiny$observeEvent(
    input$climate_model,
    {
      tif_path <- predictions_summary |>
        filter(climate_model == input$climate_model) |>
        slice(1) |>
        pull(tif_path)

      ras <- process_raster_file(tif_path)

      leaflet$leafletProxy(
        "rasterMap"
      ) |>
      leaflet$clearImages() |>
        leaflet$clearControls() |>
          leaflet$addRasterImage(
        ras,
        colors = leaflet$colorNumeric(
          "plasma",
           domain = minmax(ras),
            na.color = "transparent"),
        opacity = 0.85,
        project = TRUE
      )
    }
  )
}

shiny$shinyApp(ui = ias_app_ui, server = ias_app_server)
