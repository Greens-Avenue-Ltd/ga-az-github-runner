resource "azurerm_linux_virtual_machine" "runners" {
  name                            = "${var.project_name}-${var.shared_environment}-vm1"
  resource_group_name             = azurerm_resource_group.global_resource_group.name
  location                        = azurerm_resource_group.global_resource_group.location
  size                            = var.runner_size
  admin_username                  = "runner-admin"
  network_interface_ids           = [azurerm_network_interface.this.id]

  admin_ssh_key {
    username   = "runner-admin"
    public_key = tls_private_key.this.public_key_openssh
  }

  os_disk {
    caching              = "None"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = split(":", var.image_urn)[0]
    offer     = split(":", var.image_urn)[1]
    sku       = split(":", var.image_urn)[2]
    version   = split(":", var.image_urn)[3]
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.this.primary_blob_endpoint
  }

  custom_data = base64encode(local.custom_data)
}