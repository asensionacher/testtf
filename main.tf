module "example" {
  source  = "registry.local:9080/privateprivate/naming/azurerm"
  version = "0.4.2"
}

output "test" {
  value = module.example
}
