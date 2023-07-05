terraform {
  required_providers {
    oci = {
      source                = "oracle/oci"
      configuration_aliases = [oci.home]
      version               = ">= 4.115.0"
    }
  }
  required_version = ">= 1.2.0"
}

#provider "oci" {
#	region = var.region
#}

provider "oci" {
  auth                = "SecurityToken"
  config_file_profile = "ab"
  #alias  = "home"
  #region = lookup(local.region_map, data.oci_identity_tenancy.tenancy.home_region_key)
  region = "us-ashburn-1"
}