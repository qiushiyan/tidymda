#' Mixture discriminant analysis
#'
#' @description
#' `discrim_mixture` defines an LDA extension model that estimates within-class
#' density using mixture distributions.
#'
#' @param mode A single character string fort the model type. Only possible value
#'   'classification'.
#' @param sub_classes An integer for the number of sub-classes in each class.
#'
#' @example
#' discrim_mixture(sub_classes = 3)
discrim_mixture <-
  function(mode = "classification", sub_classes = NULL) {
    # Check for correct mode
    if (mode  != "classification") {
      rlang::abort("`mode` should be 'classification'")
    }

    # Capture the arguments in quosures
    args <- list(sub_classes = rlang::enquo(sub_classes))

    # Save some empty slots for future parts of the specification
    new_model_spec(
      "discrim_mixture",
      args = args,
      eng_args = NULL,
      mode = mode,
      method = NULL,
      engine = NULL
    )
}

print.discrim_mixture <- function(x, ...) {
  cat("Mixture Discriminant Analysis Model Specification (", x$mode, ")\n\n", sep = "")
  parsnip::model_printer(x, ...)

  if(!is.null(x$method$fit$args)) {
    cat("Model fit template:\n")
    print(parsnip::show_call(x))
  }
  invisible(x)
}
