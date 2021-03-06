

#' @export
plot.prior <- function(x, from, to, ...){
  prior <- x

  if (missing (from)) from <- -Inf
  if (missing (to)) to <- Inf

  from <- max(from, attr(prior, "lower"))
  to <- min(to, attr(prior, "upper"))
  if (from == -Inf) from <- -1
  if (to == Inf) to <- 1

  xx <- seq(from, to, length.out = 401)
  dpr <- prior(xx)

  yticks <- pretty(c(0, dpr))
  xticks <- pretty(c(from, to))
  Parameter <- 0
  Density <- -100
  plot(Parameter, Density, yaxs="i",main = describe_prior(x),
       ylim =  range(yticks), xlim = range(xticks), xaxs="i",
       las = 1, bty = "n",  ...)
  polygon(c(xx, rev(xx)), c(dpr, rep(0, 401)),
          border = NA, col=adjustcolor("darkgray", alpha.f = .2))
  lines(xx, dpr, col = "darkgray", lty = 1, lwd = 2)
}
