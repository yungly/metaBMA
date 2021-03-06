% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dtriangular.R
\name{dtriangular}
\alias{dtriangular}
\alias{rtriangular}
\title{Triangular Distribution}
\usage{
dtriangular(x, min, peak, max, log = FALSE)

rtriangular(n, min, peak, max)
}
\arguments{
\item{x}{vector of quantiles}

\item{min}{lower bound of distribution}

\item{peak}{peak of triangle density}

\item{max}{upper bound of distribution}

\item{log}{logical; if TRUE, probabilities p are given as log(p)}

\item{n}{number of samples}
}
\description{
Distribution with a triangular density function.
}
\examples{
plot(prior("triangular", c(.2, .6, 1.3)), 0, 2)

samples <- rtriangular(1e5, .2, .5, 1)
hist(samples, 200, FALSE)
curve(dtriangular(x, .2, .5, 1), col = 2,
      add = TRUE, lwd = 2)
}
