terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.67.0"
    }
  }
}
provider "azurerm" {
  subscription_id = "b1627956-95e4-4381-86e1-629f221ce542"
  client_id       = "b9757333-731c-4772-b24a-302a8739dc66"
  client_secret   = "NHY8Q~kJyxiy-5jerKTRkzw24BxIDbv6UYsE-csR"
  tenant_id       = "cfb84c28-63d7-4fe1-91bc-bb133d2076a1"
  features {}

}
terraform{
  backend "azurerm"{
    storage_account_name = "leela12345"
    container_name = "tfstate"
    key = "terraform.tfstate"
    access_key = "oyyw/mn8K7YUbYI5CR6KWb6Bmr/AJsf3AAk06ObBc1kHrT6UxAqB0gf/TMETRgtXSSXCB79h7q83+AStiQhcgw=="
  }
}
