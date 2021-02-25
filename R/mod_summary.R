#' page_1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id character used to specify namespace, see \code{shiny::\link[shiny]{NS}}
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_summary_ui <- function(id){
  ns <- NS(id)
  tagList(
    DT::DTOutput(outputId = ns("table"))
  )
}

#' page_1 Server Function
#'
#' @param input,output,session standard \code{shiny} boilerplate.
#' @param dataset data frame (non-reactive) with variables necessary
#' @param var reactive list of with variable type
#'
#' @noRd
mod_summary_server <- function(input, output, session, dataset, var){

  ns <- session$ns

  output$table <- DT::renderDT({

    req(dataset())

    irsSOI::make_summary_DT(dataset(), type = var$type())

  })
}


