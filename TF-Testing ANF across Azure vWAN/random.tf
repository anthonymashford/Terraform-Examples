# Create random string
resource "random_string" "random" {
  length  = 4
  special = false
}

# Create KeyVault ID
resource "random_id" "kvname" {
  byte_length = 5
  prefix      = "keyvault"
}