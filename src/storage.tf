resource "azurerm_storage_account" "this" {
  name                     = replace("${var.project_name}${var.shared_environment}sa", "-", "")
  resource_group_name      = azurerm_resource_group.global_resource_group.name
  location                 = azurerm_resource_group.global_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
