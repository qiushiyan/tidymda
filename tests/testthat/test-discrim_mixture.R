library(rsample)
library(parsnip)
library(yardstick)
library(tune)

data("two_class_dat", package = "modeldata")
example_split <- initial_split(two_class_dat, prop = 0.99)
example_train <- training(example_split)
example_test  <-  testing(example_split)

mda_spec <- discrim_mixture(sub_classes = 3) |>
  set_engine("mda")

set.seed(452)

test_that("fit", {
  mda_fit <- mda_spec %>%
    fit(Class ~ ., data = example_train, engine = "mda")
})
