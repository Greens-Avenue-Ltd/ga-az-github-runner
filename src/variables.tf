variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "ga-github-runner"
}

variable "location" {
  description = "The azure region to create the resources"
  type        = string
  default     = "UK West"
}

variable "shared_environment" {
  description = "Shared environment name"
  type        = string
  default     = "non-prod"
}

variable "tenant_id" {
  description = "The Azure Tenant ID"
  type        = string
  default     = "6d55f6f2-b0bd-4256-9676-e36cc4a90d81"
}

variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
  default     = "3c216ab8-d574-49dc-9a8b-90f88491cedc"
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default = {
    Owner       = "brian.donnelly@greensavenue.co.uk"
    Environment = "non-prod"
    Project     = "ga-github-runner"
    asset_code  = "GA-GAR"
  }
}

variable "network_range" {
  type        = string
  description = "(Optional) The network range to use for the virtual network"
  default     = "10.0.0.0/24"
}

variable "runner_size" {
  type        = string
  description = "(Optional) The size of the runner VM"
  default     = "Standard_B2s"
}

variable "image_urn" {
  type        = string
  description = "(Optional) The image URN to use for the runner VM"
  default     = "Canonical:UbuntuServer:20.04-LTS:latest"
}

variable "runner_token" {
  type        = string
  description = "(Required) The Github actions self-hosted runner registration token"
  default     = ""
}

variable "runner_version" {
  type        = string
  description = "(Optional) The version of the runner to use"
  default     = "2.329.0"
}

variable "runner_group_name" {
  type        = string
  description = "(Required) The name of the group to use for the runner"
  default     = "ga-azure"
}

variable "github_organisation" {
  type        = string
  description = "(Required) The Github organisation to use"
  default     = "Greens-Avenue-Ltd"
}
