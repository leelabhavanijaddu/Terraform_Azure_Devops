resource "azurerm_network_interface" "networkinterface" {
  name                = "Azurenic"
  location            = local.location
  resource_group_name = azurerm_resource_group.AzureRG-1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.Azure_public_ip.id
  }

  depends_on = [ 
    azurerm_virtual_network.virtualnetwork,
    azurerm_public_ip.Azure_public_ip 
  ]
}



resource "azurerm_windows_virtual_machine" "virtualmachine" {
  name                = "Azurevm"
  resource_group_name = azurerm_resource_group.AzureRG-1.name
  location            = local.location
  size                = "Standard_F2"
  admin_username      = "TempAdmin"
  admin_password      = "leela@#$148"
  network_interface_ids = [azurerm_network_interface.networkinterface.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}






