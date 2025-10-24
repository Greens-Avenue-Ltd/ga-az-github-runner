resource "azurerm_resource_group" "global_resource_group" {
  name     = "azbd-global-rg"
  location = "UK West"
  tags     = var.tags
}

