terraform {
  experiments      = [module_variable_optional_attrs]
  required_version = ">= 0.13.1"
  required_providers {
    nsxt = {
      source  = "vmware/nsxt"
      version = ">=3.2.5"
    }
  }
}