header <- dashboardHeader(title = "Student Performance")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem(
      text = "Overview",
      tabName = "overview"
    ),
    selectInput(
      inputId = "selectGender",
      label = "Select Gender:",
      choices = genderOpt,
      multiple = T,
      selected = genderOpt
    ),
    selectInput(
      inputId = "selectRace",
      label = "Race Group:",
      choices = raceOpt,
      multiple = T,
      selected = raceOpt
    ),
    selectInput(
      inputId = "selectParentEdu",
      label = "Parent's Education Level:",
      choices = parenteducationOpt,
      multiple = T,
      selected = parenteducationOpt
    ),
    selectInput(
      inputId = "selectLunch",
      label = "Lunch Category:",
      choices = lunchOpt,
      multiple = T,
      selected = lunchOpt
    )
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(
      tabName = "overview",
      fluidRow(
        column(
          width = 6,
          plotlyOutput("genderPlot")
        ),
        column(
          width = 6,
          plotlyOutput("racePlot")
        ),
      fluidRow(
        column(
          width = 6,
          plotlyOutput("leveleduPlot")
        ),
        column(
          width = 6,
          plotlyOutput("testprepPlot")
        )
        
      )
        
          
          
        
      )
    ),
    tabItem(
      tabName = "data",
      
    )
  )
)

dashboardPage(
  header = header,
  body = body,
  sidebar = sidebar
)