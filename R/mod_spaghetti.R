#' spaghetti UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_spaghetti_ui <- function(id){
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("spaghetti"))
  )
}

#' spaghetti Server Function
#'
#' @param dataset
#'
#' @noRd
mod_spaghetti_server <- function(input, output, session, dataset){
  ns <- session$ns

  output$spaghetti <- plotly::renderPlotly({
    req(dataset())
    irs.soi::make_spaghetti_plot(dataset())
  })
}


