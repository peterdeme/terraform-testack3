resource "random_string" "random" {
  length           = 9
  special          = true
  override_special = "/@£$"
}

module "peterd-module" {
  source  = "onprem.spacelift.sh/spacelift/peterd-module/default"
  version = "0.3.0"
}
