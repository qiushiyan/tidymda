sub_classes <- function(range = c(1L, 10L), trans = NULL) {
  dials::new_quant_param(
    type = "integer",
    range = range,
    inclusive = c(TRUE, TRUE),
    trans = trans,
    label = c(sub_classes = "# of sub classes"),
    finalize = NULL
  )
}

tunable.discrim_mixture <- function(x, ...) {
  tibble::tibble(
    name = c("sub_classes"),
    call_info = list(list(pkg = NULL, fun = "sub_classes")),
    source = "model_spec",
    component = "discrim_mixture",
    component_id = "main"
  )
}
