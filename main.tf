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
      source  = "registry.local:9080/privateprivate/azurerm"
      version = "4.57.0"
    }
  }
}

provider "azurerm" {
  features {}
}


module "naming" {
  source  = "registry.local:9080/privateprivate/naming/azurerm"
  version = "0.4.2"
  suffix = [ var.suffix ]
}

resource "azurerm_resource_group" "example" {
  count = 100
  name     = module.naming.resource_group.name
  location = "West Europe"
}

output "test" {
  value = azurerm_resource_group.example[0].name
}
