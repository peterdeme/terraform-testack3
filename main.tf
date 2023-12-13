variable "image_id" {
  type = string
  default = "default"
}

output "image_id" {
  value = var.image_id
}

resource "random_string" "random" {
  length           = 5
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random2" {
  length           = 12
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random10" {
  length           = 18
  special          = true
  override_special = "/@£$"
}

output "randomstring_result" {
  value = random_string.random.result
}
