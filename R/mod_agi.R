#' Function to plot AGI in aggregate or per cap
#'
#' @description A shiny Module.
#'
#' @param id character used to specify namespace, see \code{shiny::\link[shiny]{NS}}
#'
#' @return a \code{shiny::\link[shiny]{tagList}} containing UI elements
#' @export
#'
#' @importFrom shiny NS tagList
mod_agi_ui <- function(id){
  ns <- NS(id)

  tagList(
    plotly::plotlyOutput(ns("agi_level"))
    )

}

#' Function to plot AGI in aggregate or per cap
#'
#' @param input,output,session standard \code{shiny} boilerplate.
#' @param dataset data frame (non-reactive) with variables necessary
#' @param var reactive list of with variable type
#'
#' @export
mod_agi_server <- function(input, output, session, dataset, var){
  ns <- session$ns

  output$agi_level <- plotly::renderPlotly({
    req(dataset())
    irs.soi::make_agi_graph(dataset(), type = var$type())
  })

}

## To be copied in the UI
# mod_agi_ui("agi_ui_1")

## To be copied in the server
# callModule(mod_agi_server, "agi_ui_1")

