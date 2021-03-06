% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/depthDensity.R
\name{depthDensity}
\alias{depthDensity}
\title{Depth weighted density estimator}
\usage{
depthDensity(x, y, nx = 5, ny = 32, xg = NULL, yg = NULL, ...)
}
\arguments{
\item{x}{numeric vector}

\item{y}{numeric vector}

\item{nx}{the number of equally spaced points at which the density is to be estimated in x-dimension.}

\item{ny}{the number of equally spaced points at which the density is to be estimated in x-dimension.}

\item{xg}{vector of point at which the density is to be estimated.}

\item{yg}{vector of point at which the density is to be estimated.}

\item{...}{arguments passed to depthLocal.}
}
\description{
Experimental function used to fit depth weighted density estimator.
}
\examples{

\dontrun{
# .sampleData is special function for creating
# data for testing conditional denisty estimators
data <- DepthProc:::.sampleData(1:5, 100)
x <- data[, 1]
y <- data[, 2]
plot(x, y)
dep <- depthDensity(x, y)
plot(dep, type = "raw")
plot(dep, type = "depth")
}

}
\references{
Kosiorowski D. and Zawadzki Z. (2014) Notes on optimality of predictive distribution pseudo-estimators in the CHARME models and automatic trading strategies, FindEcon2014, submitted
}
