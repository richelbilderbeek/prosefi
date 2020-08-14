test_that("use", {
  haplotype <- "HLA-DPB103:01"
  peptide_length <- 13
  percentile <- 0.02
  s <- find_tmh_binder(
    haplotype = haplotype,
    peptide_length = peptide_length,
    percentile = percentile
  )
  s
  t <- bbbq::predict_counts(
    peptide = s,
    haplotype = haplotype,
    peptide_length = peptide_length,
    percentile = percentile
  )
  t$n_binders_tmh
  expect_true()
})
