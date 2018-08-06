provider "azurerm" {
  version = "1.12.0"
}

#
# a different rg for each aks instance
#
resource "azurerm_resource_group" "aks-rg" {
  location  = "${var.location}"
  name      = "${var.cluster_resource_group_name}"
}

#
# create the AKS cluster
#

resource "azurerm_kubernetes_cluster" "aks-cluster" {

  resource_group_name = "${azurerm_resource_group.aks-rg.name}"
  location            = "${azurerm_resource_group.aks-rg.location}"
  name                = "${var.aks_cluster_name}"

  kubernetes_version  = "${var.kubernetes_version}"
  dns_prefix          = "akstestagent1"

  "agent_pool_profile" {
    name            = "agp001"
    vm_size         = "Standard_D4s_v3"
    count           = "${var.nodes_count}"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  "service_principal" {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  "linux_profile" {
    admin_username = "aksadminuser1"
    "ssh_key" {
      key_data = "${var.ssh_key}"
    }
  }

}