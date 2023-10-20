terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}
# variable "ssh_public_key" {
#   description = "Path to the SSH public key file"
#   type        = string
#   default     = "/Azure/azure_rsa.pub" # Provide the correct path to your SSH public key
# }

resource "azurerm_resource_group" "resource_group" {
  name     = "terraform-backend-rg"
  location = "East US"
 

}

resource "azurerm_kubernetes_cluster" "terraform-k8s" {
  name                = "myAKSCluster"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  dns_prefix          = "terraform-k8sdns"
  # linux_profile {
  #   admin_username = "ubuntu"

  #   ssh_key {
  #     key_data = file(ssh_public_key)
  #   }
  # }

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_DS2_v2"
  }

  service_principal {
    client_id     = "1c8110c3-6584-4ab4-b17c-6f9b05e77bce"
    client_secret = "rjo8Q~boxqPFC5ldQMyo.k5~UkeaTEjrew1ajaX6"
  }

  tags = {
    environment = "dev"
  }
}
