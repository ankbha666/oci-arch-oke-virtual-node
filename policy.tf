# Create the Serverless OKE policy in root compartment,

resource "oci_identity_policy" "oke_virtual_node_policy" {
  count          = var.create_IAM_policy ? 1 : 0
  provider       = oci.home
  compartment_id = var.tenancy_ocid
  name           = "oke_virtual_node_policy"
  description    = "policy to allow Virtual Nodes to use Contianer Instances"

  statements = [format("define tenancy ankitbhalla786 as ocid1.tenancy.oc1..aaaaaaaa2zoealkeeerwxvl5zr2boiyykckzilfzyimadxngxezwz3gd472q"),
    format("define compartment ankitbhalla786 as ocid1.tenancy.oc1..aaaaaaaa2zoealkeeerwxvl5zr2boiyykckzilfzyimadxngxezwz3gd472q"),
    format("endorse any-user to associate compute-container-instances in compartment ankitbhalla786 of tenancy ankitbhalla786 with subnets in tenancy where ALL {request.principal.type='virtualnode',request.operation='CreateContainerInstance',request.principal.subnet=2.subnet.id}"),
    format("endorse any-user to associate compute-container-instances in compartment ankitbhalla786 of tenancy ankitbhalla786 with vnics in tenancy where ALL {request.principal.type='virtualnode',request.operation='CreateContainerInstance',request.principal.subnet=2.subnet.id}"),
  format("endorse any-user to associate compute-container-instances in compartment ankitbhalla786 of tenancy ankitbhalla786 with network-security-group in tenancy where ALL {request.principal.type='virtualnode',request.operation='CreateContainerInstance'}")]

  #Optional
  defined_tags  = {}
  freeform_tags = {}

}