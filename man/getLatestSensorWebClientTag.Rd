% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/swc-update.R
\name{getLatestSensorWebClientTag}
\alias{getLatestSensorWebClientTag}
\title{Get latest JavaScript SensorWebClient version}
\usage{
getLatestSensorWebClientTag(owner = "52North", repo = "js-sensorweb-client")
}
\arguments{
\item{owner}{the GitHub repository owner}

\item{repo}{the GitHub repository name}
}
\value{
the latest version or 'develop'
}
\description{
\code{getLatestSensorWebClientTag} retrieves the latest tag on GitHub or 'develop' if no tags are found.
}
\examples{
\dontrun{
 installSensorWebClient()
}
}

