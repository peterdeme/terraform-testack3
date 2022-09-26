resource "random_string" "random" {
  length           = 23
  special          = true
  override_special = "/@£$"
}
