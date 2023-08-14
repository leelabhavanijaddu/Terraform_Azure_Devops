resource "azurerm_virtual_network" "virtualnetwork"{
  name                = "Azurevnet"
  location            = local.location
  resource_group_name = azurerm_resource_group.AzureRG-1.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  # subnet {
  #   name           = "subnet1"
  #   address_prefix = "10.0.1.0/24"
  # }
}

resource azurerm_subnet "subnet1"{
  name = "subnet1"
  virtual_network_name = azurerm_virtual_network.virtualnetwork.name
  resource_group_name = azurerm_resource_group.AzureRG-1.name
  address_prefixes = ["10.0.1.0/24"]
}

