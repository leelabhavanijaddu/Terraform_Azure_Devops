terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.67.0"
    }
  }
}
provider "azurerm" {
  subscription_id = "****************"
  client_id       = "*******************"
  client_secret   = "*********************"
  tenant_id       = "********************"
  features {}

}
terraform{
  backend "azurerm"{
    storage_account_name = "storageacc"
    container_name = "container"
    key = "terraform.tfstate"
    access_key = "<access_key_of_storageacc>"
  }
}
