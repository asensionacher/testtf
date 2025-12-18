variable "suffix" {
type = string
default = "default"
}

variable "prefix" {
  type        = string
  default     = "default"
}

terraform {
  backend "azurerm" {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "http://registry.local:9080/privateprivate/azurerm"
      version = "=4.57.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}


module "naming" {
  source  = "registry.local:9080/privateprivate/naming/azurerm"
  version = "0.4.2"
  suffix = [ var.suffix ]
}

resource "azurerm_resource_group" "example" {
  name     = module.naming.resource_group.name
  location = "West Europe"
}

output "test" {
  value = azurerm_resource_group.example.name
}
