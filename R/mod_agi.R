#' agi UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_agi_ui <- function(id){
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("agi_level")))
}

#' agi Server Function
#'
#' @param dataset
#'
#' @noRd
mod_agi_server <- function(input, output, session, dataset){
  ns <- session$ns

  output$agi_level <- plotly::renderPlotly({

    irs.soi::make_agi_graph(dataset())

  })

}

## To be copied in the UI
# mod_agi_ui("agi_ui_1")

## To be copied in the server
# callModule(mod_agi_server, "agi_ui_1")

