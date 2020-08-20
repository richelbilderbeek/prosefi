#' Find a TMH sentence that has at least one binder
#' @inheritParams default_params_doc
#' @export
find_tmh_binder <- function(
  haplotype,
  peptide_length,
  percentile,
  ic50_prediction_tool
) {

  aa_verbs <- stringr::str_subset(
    stringr::str_to_upper(qdapDictionaries::action.verbs),
    paste0(
      "^[",
      paste0(Peptides::aaList(), collapse = ""),
      "]+$"
    )
  )

  aa_positive <- stringr::str_subset(
    stringr::str_to_upper(qdapDictionaries::positive.words),
    paste0(
      "^[",
      paste0(Peptides::aaList(), collapse = ""),
      "]+$"
    )
  )

  aa_dolch <- stringr::str_subset(
    stringr::str_to_upper(qdapDictionaries::Dolch),
    paste0(
      "^[",
      paste0(Peptides::aaList(), collapse = ""),
      "]+$"
    )
  )

  all_words <- c(aa_verbs, aa_positive, aa_dolch)

  while (1) {
    aa <- paste0(sample(all_words, size = 10, replace = FALSE), collapse = "")
    if (!pureseqtmr::is_tmh(aa)) next()

    t <- bbbq::predict_counts(
      peptide = aa,
      haplotype = haplotype,
      peptide_length = peptide_length,
      percentile = percentile,
      ic50_prediction_tool = ic50_prediction_tool
    )
    if (t$n_binders_tmh > 0) {
      return(aa)
    }
  }
}
