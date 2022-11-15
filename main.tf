resource "random_string" "random" {
  length           = 21
  special          = true
  override_special = "/@£$"
}
