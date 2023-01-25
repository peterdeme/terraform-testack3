resource "random_string" "random" {
  length           = 24
  special          = true
  override_special = "/@£$"
}
