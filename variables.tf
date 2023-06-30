# Compartment to deploy OKE Virual Node Cluster
variable "compartment_id" {
  type    = string
  default = ""
}

variable "tenancy_ocid" {
  type    = string
  default = ""
}


variable "kubernetes_version" {
  type    = string
  default = "v1.25.4"
}

variable "region" {
  type    = string
  default = ""
}

# Shape of Virtual Nodes
variable "pod_shape" {
  type    = string
  default = "Pod.Standard.E4.Flex"
}


# number of Virtual Nodes
variable "virtual_node_count" {
  type    = number
  default = 1
}

variable "create_IAM_policy" {
  description = "Set to true to create the resource, false to skip it."
  type        = bool
  default     = true
}

variable "deploy_ingress_controller" {
  description = "Set to true to create the resource, false to skip it."
  type        = bool
  default     = true
}