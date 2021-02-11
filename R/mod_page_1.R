#' page_1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_page_1_ui <- function(id){
  ns <- NS(id)
  tagList(
    h2("Summary DT"),
    DT::DTOutput(outputId = ns("summary"))

  )
}

#' page_1 Server Function
#'
#' @noRd
mod_page_1_server <- function(input, output, session){
  ns <- session$ns

  output$summary <- DT::renderDT(

    irs.soi::make_summary_DT(irs.soi::irs_app_data)

  )

}

## To be copied in the UI
# mod_page_1_ui("page_1_ui_1")

## To be copied in the server
# callModule(mod_page_1_server, "page_1_ui_1")

