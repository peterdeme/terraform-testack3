resource "random_string" "random" {
  length           = 7
  special          = true
  override_special = "/@£$"
}

module "terraform-module" {
  source  = "aws-eks.spacelift.sh/aws-eks/terraform-module/default"
  version = "0.2.0"
}
