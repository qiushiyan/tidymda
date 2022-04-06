#' @export
tidy.mda <- function(fit_obj, ...) {
  coefs <- fit_obj$means
  ret <- tibble::as_tibble(t(coefs))

  ret
}


