# nocov
make_discrim_mixture <- function() {
  # register model, set mode, engine and dependency
  parsnip::set_new_model("discrim_mixture")
  parsnip::set_model_mode("discrim_mixture", "classification")
  parsnip::set_model_engine("discrim_mixture", "classification","mda")

  parsnip::set_dependency("discrim_mixture", "mda", "mda")
  parsnip::set_dependency("discrim_mixture", "mda", "tidymda")

  # declare main arguments, as in discrim_mixture(arg)
  parsnip::set_model_arg(
    model = "discrim_mixture",
    eng = "mda",
    parsnip = "sub_classes",
    original = "subclasses",
    func = list(fun = "sub_classes"),
    has_submodel = FALSE
  )

  # set fit engine
  parsnip::set_fit(
    model = "discrim_mixture",
    eng = "mda",
    mode = "classification",
    value = list(
      interface = "formula",
      protect = c("formula", "data"),
      func = c(pkg = "mda", fun = "mda"),
      defaults = list()
    )
  )

  # set preprocessing
  parsnip::set_encoding(
    model = "discrim_mixture",
    eng = "mda",
    mode = "classification",
    options = list(
      predictor_indicators = "traditional",
      compute_intercept = TRUE,
      remove_intercept = TRUE,
      allow_sparse_x = FALSE
    )
  )

  # set class prediction
  parsnip::set_pred(
    model = "discrim_mixture",
    eng = "mda",
    mode = "classification",
    type = "class",
    value = list(
      pre = NULL,
      post = function(x, object) {
        tibble::as_tibble(x)
      },
      func = c(fun = "predict"),
      args =
        # These lists should be of the form:
        # {predict.mda argument name} = {values provided from parsnip objects}
        list(
          # We don't want the first two arguments evaluated right now
          # since they don't exist yet. `type` is a simple object that
          # doesn't need to have its evaluation deferred.
          object = rlang::expr(object$fit),
          newdata = rlang::expr(new_data),
          type = "class"
        )
  ))

  # set probability prediction
  parsnip::set_pred(
    model = "discrim_mixture",
    eng = "mda",
    mode = "classification",
    type = "prob",
    value = list(
      pre = NULL,
      post = function(x, object) {
        tibble::as_tibble(x)
      },
      func = c(fun = "predict"),
      args = list(
        object = rlang::expr(object$fit),
        newdata = rlang::expr(new_data),
        type = "posterior"
      )
    )
  )
}

