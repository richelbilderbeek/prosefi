#' This function does nothing. It is intended to inherit the documentation
#' of the parameters from.
#' @param haplotype the MHC haplotype name
#' @param ic50_prediction_tool the IC50 prediction tool
#' @param peptide_length length of the peptide
#' @param percentile percentile lowest IC50s to classify an IC50
#'   as a binder
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  haplotype,
  ic50_prediction_tool,
  peptide_length,
  percentile
) {
  # Nothing
}
