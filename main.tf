resource "random_string" "random" {
  length           = 6
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random2" {
  length           = 7
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random4" {
  length           = 7
  special          = true
  override_special = "/@£$"
}

moved {
from = random_string.random3
to = random_string.random4
}
