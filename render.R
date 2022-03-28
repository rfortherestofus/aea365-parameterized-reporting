library(tidyverse)
library(palmerpenguins)
library(rmarkdown)

all_penguin_species <- c("Adelie", "Chinstrap", "Gentoo")

reports <- tibble(
  output_file = str_c(all_penguin_species, "-report.pdf"),
  params = map(all_penguin_species, ~list(penguin_species = .))
)

reports %>%
  pwalk(render, input = "report.Rmd")
