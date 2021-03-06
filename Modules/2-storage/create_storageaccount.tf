resource "random_id" "storage_account" {
  byte_length = 4
}

resource "azurerm_storage_account" "storageaccount" {
  name                     = lower(random_id.storage_account.hex) // hex - The generated id presented in padded hexadecimal digits. This result will always be twice as long as the requested byte length.
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

output "storageaccount_name" {
  value = azurerm_storage_account.storageaccount.name
}