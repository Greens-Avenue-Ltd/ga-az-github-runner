terraform {
  backend "azurerm" {
    resource_group_name  = "azbd-global-rg"
    storage_account_name = "azbdterraformsa"
    container_name       = "ga-github-runner"
    key                  = "terraform.tfstate"
  }
}
