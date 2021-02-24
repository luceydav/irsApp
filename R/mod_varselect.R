#' varselect UI Function
#'
#' @description A shiny Module.
#'
#' @param id, character used to specify namespace, see \code{shiny::\link[shiny]{NS}}
#'
#' @return a \code{shiny::\link[shiny]{tagList}} containing UI elements
#'
#' @importFrom shiny NS tagList
mod_varselect_ui <- function(id){
  ns <- NS(id)

  var_choices <- c("AGI" = "agi",
                   "Per Capita" = "per_cap")

  shiny::radioButtons(ns("type"),
                        "Select View:",
                        c("AGI" = "agi",
                          "Per Capita" = "per_cap")
  )
}

#' varselect Server Function
#'
#' @param input,output,session standard \code{shiny} boilerplate.
#'
#' @return list with following components
#' \describe{
#'   \item{type}{reactive character indicating type selection}
#' }
mod_varselect_server <- function(input, output, session){

  return(
    list(
      type = reactive({ input$type })
    )
  )

}

## To be copied in the UI
# mod_varselect_ui("varselect_ui_1")

## To be copied in the server
# callModule(mod_varselect_server, "varselect_ui_1")

