variable "suffix" {
type = string
default = "default"
}

variable "prefix" {
  type        = string
  default     = "default"
}

module "example" {
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
