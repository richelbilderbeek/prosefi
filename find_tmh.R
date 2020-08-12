library(qdapDictionaries)


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

all_words <- c(aa_verbs, aa_positive, aa_verbs)
mean(nchar(aa_dolch))

while (1) {
  aa <- paste0(sample(all_words, size = 15, replace = FALSE), collapse = "")
  if (pureseqtmr::is_tmh(aa)) {
    message(aa)
  }

}

