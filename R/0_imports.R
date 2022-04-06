
#' @keywords internal
"_PACKAGE"

#' @import rlang
#' @importFrom parsnip set_new_model set_model_mode set_model_engine
#' @importFrom parsnip set_dependency set_model_arg new_model_spec
#' @importFrom parsnip set_encoding set_pred multi_predict
#' @importFrom parsnip show_call model_printer
#' @importFrom dials new_quant_param
#' @importFrom tibble as_tibble
#' @export
parsnip::multi_predict

#' @importFrom generics tidy
#' @export
generics::tidy

#' @importFrom generics tunable
#' @export
generics::tunable
