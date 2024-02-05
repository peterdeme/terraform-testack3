resource "random_string" "random" {
  length           = 5
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random2" {
  length           = 6
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random3" {
  length           = 5
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random4" {
  length           = 9
  special          = true
  override_special = "/@£$"
}

resource "random_pet" "pet1" {
  length = 6
}

resource "random_pet" "pet2" {
  length = 7
}

output "randomstring_result" {
  value = random_string.random.result
}
