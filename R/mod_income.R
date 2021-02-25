#' income UI Function
#'
#' @description A shiny Module.
#'
#' @param id character used to specify namespace, see \code{shiny::\link[shiny]{NS}}
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_income_ui <- function(id){
  ns <- NS(id)
  tagList(
    DT::DTOutput(outputId = ns("income"))
  )
}

#' income Server Function
#'
#' @param input,output,session standard \code{shiny} boilerplate.
#' @param dataset data frame (non-reactive) with variables necessary
#' @param var reactive list of with variable type
#'
#' @noRd
mod_income_server <- function(input, output, session, dataset, var){

  ns <- session$ns

  output$income <- DT::renderDT({

    req(dataset())

    irsSOI::make_income_DT(dataset(), type = var$type())

  })
}

