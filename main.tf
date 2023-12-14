resource "random_string" "random" {
  length           = 5
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random2" {
  length           = 7
  special          = false
  override_special = "/@£$"
}

resource "random_string" "random3" {
  length           = 7
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random12" {
  length           = 12
  special          = false
  override_special = "/@£$"
}

resource "random_pet" "pet1" {
  length = 6
}

output "randomstring_result" {
  value = random_string.random.result
}
