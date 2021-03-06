% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runRaMP.R
\name{runRaMPapp}
\alias{runRaMPapp}
\title{Run Shiny App}
\usage{
runRaMPapp(conpass = NULL, host = "localhost", username = "root",
  dbname = "ramp")
}
\arguments{
\item{conpass}{password for database access (string)}

\item{host}{host name for database access (default is "localhost")}

\item{username}{username for database access}

\item{dbname}{database name for database access}
}
\description{
This function launches the RShiny app.  It requires a connection to the RaMP database as input, which requires running the function connectoToRaMP() and providing the MySQL password.
}
\examples{
\dontrun{
con <- connectToRaMP(dbname="ramp",username="root",password="mypassword")
runRaMPapp(con=con)
}
}
