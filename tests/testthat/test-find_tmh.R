test_that("use", {
  s <- find_tmh()
  expect_true(pureseqtmr::is_tmh(s))
  expect_equal(nchar(s), Peptides::lengthpep(s))
})
