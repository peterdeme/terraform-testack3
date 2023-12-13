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
  length           = 7
  special          = true
  override_special = "/@£$"
}



output "randomstring_result" {
  value = random_string.random.result
}
