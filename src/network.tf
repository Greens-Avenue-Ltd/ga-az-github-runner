resource "azurerm_virtual_network" "this" {
  name                = "${var.project_name}-${var.shared_environment}-vnet"
  resource_group_name = azurerm_resource_group.global_resource_group.name
  location            = azurerm_resource_group.global_resource_group.location

  address_space = [var.network_range]
}

resource "azurerm_subnet" "runners" {
  name                 = "${var.project_name}-${var.shared_environment}-subnet"
  resource_group_name  = azurerm_resource_group.global_resource_group.name
  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes = [cidrsubnet(var.network_range, 0, 0)]
}

resource "azurerm_network_interface" "this" {
  name                = "${var.project_name}-${var.shared_environment}-nic"
  resource_group_name = azurerm_resource_group.global_resource_group.name
  location            = azurerm_resource_group.global_resource_group.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.runners.id
    private_ip_address_allocation = "Dynamic"
  }
}
