variable "location" {
  description = "geographical location"
}

variable "cluster_resource_group_name" {
  description = "resource group name"
}

variable "aks_cluster_name" {
  description = "kubernetes cluster name as it'll appear on azure UI"
}

variable "client_id" {
  description = "provided as env variable"
}
variable "client_secret" {
  description = "provided as env variable"
}

variable "kubernetes_version" {
  description = "version of the kubernetes cluster"
  default = "1.10.6"
}

variable "ssh_key" {
  description = "provided as env variable"
}

variable "nodes_count" {
  description = "kubernetes cluster nodes count"
}


variable "tags" {
  type = "map"
}