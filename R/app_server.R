#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @import shinyWidgets
#' @import irs.soi
#'
#' @noRd
app_server <- function( input, output, session ) {

  selected_data <- callModule(
    module = shinyWidgets::selectizeGroupServer,
    id = "my-filters",
    data = irs.soi::irs_app_data,
    vars = c("state", "county", "post_office_city", "zipcode", "agi_level")
  )
  # List the first level callModules here
  shiny::callModule(mod_summary_server,
                    "summary_ui_1",
                    dataset = selected_data)
  shiny::callModule(mod_agi_server,
                    "agi_ui_1",
                    dataset = selected_data)
  shiny::callModule(mod_taxRate_server,
                    "taxRate_ui_1",
                    dataset = selected_data)

}
