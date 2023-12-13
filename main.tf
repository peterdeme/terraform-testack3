variable "image_id" {
  type = string
  default = "default"
}

output "image_id" {
  value = var.image_id
}

resource "random_string" "random" {
  length           = 26
  special          = true
  override_special = "/@£$"
}

output "randomstring_result" {
  value = random_string.random.result
}
