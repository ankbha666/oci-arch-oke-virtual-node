resource "random_id" "tag" {
  byte_length = 2
}

resource "oci_identity_tag_namespace" "ns_virtual_node" {
  provider       = oci.home
  compartment_id = var.compartment_id
  description    = "virtual_node_TagNamespace"
  name           = "virtual_node\\deploy-microservices-${random_id.tag.hex}"

  provisioner "local-exec" {
    command = "sleep 10"
  }

}

resource "oci_identity_tag" "tag_virtual_node" {
  provider         = oci.home
  description      = "OKE Virtual Nodes"
  name             = "release"
  tag_namespace_id = oci_identity_tag_namespace.ns_virtual_node.id

  validator {
    validator_type = "ENUM"
    values         = ["release", "1.0.1"]
  }

  provisioner "local-exec" {
    command = "sleep 120"
  }
}