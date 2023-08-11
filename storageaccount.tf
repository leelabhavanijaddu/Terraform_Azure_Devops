##this is used to create storage account 
resource "azurerm_storage_account" "storageaccount" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.LeelaRG-1.name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

##this is used to add storage container
resource "azurerm_storage_container" "leela" {
  name                  = "leela"
  storage_account_name  = azurerm_storage_account.storageaccount.name
  container_access_type = "private"
}

##this is used to upload local file on to the container
resource "azurerm_storage_blob" "sample" {
  name                   = "sample"
  storage_account_name   = azurerm_storage_account.storageaccount.name
  storage_container_name = "leela"
  type                   = "Block"
  source                 = "sample"
}
