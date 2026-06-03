variable "suffix" {
type = string
default = "default"
}

variable "prefix" {
  type        = string
  default     = "default"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}

terraform {
  backend "local" {}
}

provider "azurerm" {
  features {}
}


module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.2"
  suffix = [ var.suffix ]
}

output "test" {
  value = module.naming.resource_group.name
}
