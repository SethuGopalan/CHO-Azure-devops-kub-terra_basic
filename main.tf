provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks" {
  name     = "terraform-backend-rg"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "myAKSCluster"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "myaksdns"

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
