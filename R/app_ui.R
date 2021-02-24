#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#'
#' @import shiny
#' @import shinydashboard
#' @import shinyWidgets
#' @import irs.soi
#'
#' @noRd
app_ui <- function(request) {

  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    shinydashboard::dashboardPage(

      shinydashboard::dashboardHeader(title = "IRS Tax Dashboard"),

      shinydashboard::dashboardSidebar(
        shinydashboard::sidebarMenu(
          shinydashboard::menuItem("Tables", tabName = "table", icon = shiny::icon("table")),
          shinydashboard::menuItem("Charts", tabName = "charts", icon = shiny::icon("bar-chart-o")),
          shinydashboard::menuItem("View", mod_varselect_ui("varselect_ui_1"), icon = shiny::icon("gear")),
          shinyWidgets::selectizeGroupUI(
            id = "my-filters",
            inline = FALSE,
            params = list(
              var_one = list(
                inputId = "state",
                title = "Specify States",
                placeholder = 'select'
              ),
              var_two = list(
                inputId = "county",
                title = "Specify Counties",
                placeholder = 'select'
              ),
              var_three = list(
                inputId = "post_office_city",
                title = "Specify Cities",
                placeholder = 'select'
              ),
              var_four = list(
                inputId = "zipcode",
                title = "Specify Zipcodes",
                placeholder = 'select'
              ),
              var_five = list(
                inputId =  "agi_level",
                title = "Specify Income Levels",
                placeholder = 'select'
              )
            )
          )
      )),

      shinydashboard::dashboardBody(

        shinydashboard::tabItems(
          # First tab content
          shinydashboard::tabItem(tabName = "table",
            shinydashboard::tabBox(
              title = "Selected Tables",
              width = 12,
              shiny::tabPanel("Summary", mod_summary_ui("summary_ui_1")),
              shiny::tabPanel("Income", mod_income_ui("income_ui_1")),
              shiny::tabPanel("Deductions", mod_deductions_ui("deductions_ui_1")))),
          shinydashboard::tabItem(tabName = "charts",
            shinydashboard::tabBox(
              title = "Selected Charts",
              width = 12,
              shiny::tabPanel("AGI", mod_agi_ui("agi_ui_1")),
              shiny::tabPanel("Tax Rate", mod_taxRate_ui("taxRate_ui_1")),
              shiny::tabPanel("Compare",mod_spaghetti_ui("spaghetti_ui_1"))
        ))
      ))
  )
)
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @import shinydashboard
#' @import shinyWidgets
#'
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#'
#' @noRd
golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    golem::favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'irs.soi.shiny.golem'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

