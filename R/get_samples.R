
# data: list
# ...: => run.jags
get_samples <- function (data,
                         sample = 0,
                         ...){

  family.d <- attr(data$prior.d, "family")

  if (missing(sample) || sample <= 0 ||  # no JAGS sampling
      family.d == "custom" ||            # custom priors not supported
      attr(data$prior.tau, "family") == "custom")
    return(NULL)

  parameters <- switch(data$model,
                       "fixed" = "d.fixed",
                       "random" = c("d", "tau"))
  if (data$model == "random" && family.d != "0")
    parameters <- c(parameters, "d.random")

  jj <- jags_model(data)
  modelfile <- jj$file

  runjags.options(silent.jags=TRUE, silent.runjags=TRUE)
  suppressWarnings(
    samples <- run.jags(model = modelfile,
                        data = data[c("y","SE")],
                        monitor = parameters,
                        summarise = FALSE,
                        sample = sample,
                        ...)
  )

  out <- combine.mcmc(samples)

  return (list("samples" = out,
               "jagsmodel" = jj$model))
}
