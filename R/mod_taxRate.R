#' taxRate UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_taxRate_ui <- function(id){
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("taxrate"))
  )
}

#' taxRate Server Function
#'
#' @param dataset
#'
#' @noRd
mod_taxRate_server <- function(input, output, session, dataset){
  ns <- session$ns

  output$taxrate <- plotly::renderPlotly({
    req(dataset())
    irsSOI::make_tax_graph(dataset())

  })

}

