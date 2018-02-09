# Tab 5 Find the ontology relationship between compounds/gene and ontology location
# 
# 
# 
tabItem5<- shinydashboard::tabItem(
  tabName = "geneCompOnto",
  shinydashboard::tabBox(width = 12,
         id = "tabset5",
         height = "660px",
         shiny::tabPanel(strong("Input one by one."),"",
              shinydashboard::box(width=6,
                  title = strong("Input metabolites or ontology location"),
                  solidHeader = T,
                  height = "100%",status = "primary",
                  fluidRow(
                    column(12,
                           helpText("If given metabolites' synonym, it returns all of ontology location.
                                    If given ontology, it returns all of metabolites"),
                           textInput("ontoInput","", placeholder = "Input metabolites or ontology location"),
                           selectInput("KW_onto", "Select from list", choices = NULL),
                           radioButtons("metaOrOnto",
                                        "Define the type of given data",
                                        choices = c(
                                          'Analytes Source ID' = 'source',
                                          "Analytes Synonyms" = "name",
                                          "Biofluid Location" = "ontology")),
                           actionButton("subText_onto","Submit")
                           )
                  )
              ),
              shinydashboard::box(width = 6,title = strong("Search Result:"),solidHeader = T,
                  status = "primary",
                  fluidRow(
                    div(style = "margin:25px;",
                        downloadButton("report_onto","Generate Report"),
                        hr(),
                        textOutput("summary_onto"),
                        div(style = "height:300px;overflow-x:auto;overflow-y:auto;",
                            DT::dataTableOutput("result_onto")
                        )
                    )
                  )
              )
         ),
         shiny::tabPanel(
            title = strong("Input a list of analytes or biofluid location"),
            fluidRow(
              shinydashboard::box(width = 8,
                  solidHeader = T,
                  status = "primary",
                  title = strong("Input a list of analyte or biofluid location"),
                  shiny::mainPanel(
                    width = 12,
                    shiny::tabsetPanel(
                      type = 'tab',
                      shiny::tabPanel(
                        title = h4('Input analytes synonym'),
                        textAreaInput("input_mul_tab5",label = "",
                                      placeholder = "Input list of analytes"),
                        actionButton("sub_mul_tab5",label = "Submit synonyms")
                      ),
                      shiny::tabPanel(
                        title = h4('Input source Id'),
                        textAreaInput('input_mul_tab5_sourceid',label = '',
                                      placeholder = 'Input list of analytes source Id'),
                        actionButton('sub_mul_tab5_sourceid',label = 'Submite source ID')
                      ),
                      shiny::tabPanel(
                        title = h4('Input biofluid location'),
                        textAreaInput('input_mul_tab5_biofluid',label = '',
                                      placeholder = 'Input list of biofluids location'),
                        actionButton('sub_mul_tab5_biofluid',label = 'Submit biofluids')
                      )
                    )
                  )
              )
          ),
         
              # ,
              # shinydashboard::box(
              #   solidHeader = T,
              #   status = "primary",
              #   width = 6,
              #   title = strong("Upload the file"),
              #   fileInput("inp_file_tab5",label = "",
              #             multiple = FALSE,
              #             accept = c("text/csv","text/comma-separated-values,/text/plain",".csv",".txt"),
              #             buttonLabel = "Browse..."),
              #   actionButton("sub_file_tab5",label = "Upload")
              # )
            hr(),
            fluidRow(
              HTML("<div id='database-group-output'>"),
              shinydashboard::box(width = 12,
                  solidHeader = T,
                  status = "primary",
                  title = strong("Data preview"),
                  downloadButton("tab5_mul_report",
                                 label = "Download Biofluid"),
                  hr(),
                  DT::dataTableOutput("preview_multi_names_tab5")
              ),
              HTML("</div>")
            )
          )
        )
)


