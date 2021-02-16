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

    irs.soi::make_tax_graph(dataset())

  })

}

## To be copied in the UI
# mod_taxRate_ui("taxRate_ui_1")

## To be copied in the server
# callModule(mod_taxRate_server, "taxRate_ui_1")

