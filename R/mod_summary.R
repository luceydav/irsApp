#' page_1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_summary_ui <- function(id){
  ns <- NS(id)
  tagList(
    h2("Summary DT"),
    DT::DTOutput(outputId = ns("table"))
  )
}

#' page_1 Server Function
#'
#' @param dataset
#'
#' @noRd
mod_summary_server <- function(input, output, session, dataset){

  ns <- session$ns

  output$table <- DT::renderDT(
    irs.soi::make_summary_DT(dataset())
  )
}

## To be copied in the UI
# mod_summary_ui("summary_ui_1")

## To be copied in the server
# callModule(mod_summary_server, "summary_ui_1")

