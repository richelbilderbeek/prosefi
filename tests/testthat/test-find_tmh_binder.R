test_that("MHC-I", {
  haplotype <- "HLA-A*01:01"
  peptide_length <- 9
  percentile <- 0.02
  s <- find_tmh_binder(
    haplotype = haplotype,
    peptide_length = peptide_length,
    percentile = percentile,
    ic50_prediction_tool = "EpitopePrediction"
  )
  s
  t <- bbbq::predict_counts(
    peptide = s,
    haplotype = haplotype,
    peptide_length = peptide_length,
    percentile = percentile,
    ic50_prediction_tool = "EpitopePrediction"
  )


  expect_true(t$n_binders_tmh > 0)
})

test_that("MHC-II", {
  haplotype <- "HLA-DRB1*0101"
  peptide_length <- 13
  percentile <- 0.02
  s <- find_tmh_binder(
    haplotype = haplotype,
    peptide_length = peptide_length,
    percentile = percentile,
    ic50_prediction_tool = "netmhc2pan"
  )
  s
  t <- bbbq::predict_counts(
    peptide = s,
    haplotype = haplotype,
    peptide_length = peptide_length,
    percentile = percentile,
    ic50_prediction_tool = "EpitopePrediction"
  )
  expect_true(t$n_binders_tmh > 0)
})
