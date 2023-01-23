#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @import shinyWidgets
#' @import irsSOI
#'
#'
#' @noRd
app_server <- function( input, output, session ) {

  # Data
  selected_data <- callModule(
    module = shinyWidgets::selectizeGroupServer,
    id = "my-filters",
    data = data,
    inline = FALSE,
    vars = c("state", "county", "post_office_city", "zipcode", "agi_level")
  )

  # Type
  var <-
    shiny::callModule(mod_varselect_server, "varselect_ui_1")

  # List the first level callModules here
  shiny::callModule(mod_summary_server,
                    "summary_ui_1",
                    dataset = selected_data,
                    var = var)
  shiny::callModule(mod_income_server,
                    "income_ui_1",
                    dataset = selected_data,
                    var = var)
  shiny::callModule(mod_deductions_server,
                    "deductions_ui_1",
                    dataset = selected_data,
                    var = var)
  shiny::callModule(mod_agi_server,
                    "agi_ui_1",
                    dataset = selected_data,
                    var = var)
  shiny::callModule(mod_taxRate_server,
                    "taxRate_ui_1",
                    dataset = selected_data)
  shiny::callModule(mod_spaghetti_server,
                    "spaghetti_ui_1",
                    dataset = selected_data)

}
