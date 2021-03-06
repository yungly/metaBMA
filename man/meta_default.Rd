% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/meta_default.R
\name{meta_default}
\alias{meta_default}
\title{Defaults for Model Averaging in Meta-Analysis}
\usage{
meta_default(y, SE, labels = NULL, field = "psychology", effect = "ttest",
  ...)
}
\arguments{
\item{y}{mean in each study}

\item{SE}{standard error in each study}

\item{labels}{optional: character values with study labels}

\item{field}{either\code{"psychology"} or \code{"medicine"}
(uses partial matching, so \code{"p"} and "\code{"m"} are sufficient)}

\item{effect}{the type of effect size: either means (\code{"ttest"}),
log-odds ratios (\code{"logOR"}) or
(Fisher's z-transformed) correlations (\code{"corr"}) (also uses partial matching)}

\item{...}{further arguments passed to \code{\link{meta_bma}}}
}
\description{
Wrapper with default prior for Bayesian meta-analysis based on a literature review.
Currently, the same default is used in all cases.
}
\details{
Default prior distributions can be plotted using \code{\link{plot_default}}.

For \code{field = "psychology"}, the following defaults are used:
\itemize{
\item \code{effect = "ttest"}: Half-normal with SD=0.3 on mean effect and
    half-Cauchy with scale=.5 on standard deviation of effects.
\item \code{effect = "logOR"}: Half-normal with SD=0.3 on mean effect and
    half-Cauchy with scale=.5 on standard deviation of effects.
\item \code{effect = "corr"}: Half-normal with SD=0.3 on mean effect and
    half-Cauchy with scale=.5 on standard deviation of effects.
}

For \code{field = "medicine"}, the following defaults are used:
\itemize{
\item \code{effect = "ttest"}: Half-normal with SD=0.3 on mean effect and
    half-Cauchy with scale=.5 on standard deviation of effects.
\item \code{effect = "logOR"}: Half-normal with SD=0.3 on mean effect and
    half-Cauchy with scale=.5 on standard deviation of effects.
\item \code{effect = "corr"}: Half-normal with SD=0.3 on mean effect and
    half-Cauchy with scale=.5 on standard deviation of effects.
}
}
\examples{
\dontrun{
data(towels)
d1 <- meta_default(towels$logOR, towels$SE, towels$study,
                   field = "psych", effect = "logOR",
                   sample = 5000)
d1
plot_forest(d1)
}
}
\references{
Gronau, Q. F., Erp, S. V., Heck, D. W., Cesario, J., Jonas, K. J., & Wagenmakers, E.-J. (2017). A Bayesian model-averaged meta-analysis of the power pose effect with informed and default priors: the case of felt power. Comprehensive Results in Social Psychology, 2(1), 123-138. \url{https://doi.org/10.1080/23743603.2017.1326760}
}
\seealso{
\code{\link{meta_bma}}, \code{\link{plot_default}}
}
