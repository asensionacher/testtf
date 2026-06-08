terraform {
  required_version = ">= 1.13.0"

  required_providers {
    random = {
      source  = "api.registry.lan/my-org/random" # The provider we just created
      version = "3.9.0"
    }
  }

  # Configure the HTTP backend to use our custom API for state management.
  # Credentials are passed via environment variables — never hardcode them in .tf files.
  # Set TF_HTTP_USERNAME and TF_HTTP_PASSWORD in your shell before running terraform/tofu.
  backend "http" {
    address        = "https://tf.registry.lan/api/tfstate/naming.tfstate"
    lock_address   = "https://tf.registry.lan/api/tfstate/naming.tfstate"
    unlock_address = "https://tf.registry.lan/api/tfstate/naming.tfstate"
    lock_method    = "LOCK"
    unlock_method  = "UNLOCK"
  }
}

variable "suffix" {
type = string
default = "default"
}

variable "prefix" {
  type        = string
  default     = "default"
}


module "naming" {
  source  = "api.registry.lan/my-org/naming/azure"
  version = "0.0.1"

  # Module configuration
  # Add your module inputs here
  suffix = ["test"]
}
module "naming1" {
  source  = "api.registry.lan/my-org/naming/azure"
  version = "0.0.1"

  # Module configuration
  # Add your module inputs here
  suffix = ["test"]
}
module "naming2" {
  source  = "api.registry.lan/my-org/naming/azure"
  version = "0.0.1"

  # Module configuration
  # Add your module inputs here
  suffix = ["test"]
}
module "naming3" {
  source  = "api.registry.lan/my-org/naming/azure"
  version = "0.0.1"

  # Module configuration
  # Add your module inputs here
  suffix = ["test"]
}
module "naming4" {
  source  = "api.registry.lan/my-org/naming/azure"
  version = "0.0.1"

  # Module configuration
  # Add your module inputs here
  suffix = ["test"]
}
output "analysis_services_server" {
  value = module.naming.analysis_services_server
}
