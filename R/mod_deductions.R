
#' income UI Function
#'
#' @description A shiny Module.
#'
#' @param input,output,session standard \code{shiny} boilerplate.
#' @param dataset data frame (non-reactive) with variables necessary
#' @param var reactive list of with variable type
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_deductions_ui <- function(id){

  ns <- NS(id)

  tagList(
    DT::DTOutput(outputId = ns("deductions"))
  )

}

#' income Server Function
#'
#' @param dataset
#'
#' @noRd
mod_deductions_server <- function(input, output, session, dataset, var){

  ns <- session$ns

  output$deductions <- DT::renderDT(
    irs.soi::make_deductions_DT(dataset(), type = var$type())

  )
}

