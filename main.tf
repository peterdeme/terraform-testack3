variable "image_id" {
  type = string
}

output "image_id" {
  value = image_id
}

resource "random_string" "random" {
  length           = 24
  special          = true
  override_special = "/@£$"
}

output "randomstring_result" {
  value = random_string.random.result
}
