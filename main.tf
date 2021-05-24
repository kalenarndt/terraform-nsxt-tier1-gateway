locals {
  tier1_gateways     = var.tier1_gateways
  tier0_gateway_path = var.tier0_gateway_path
}

// resource block that loops over a map variable to create multiple Tier1 gateways. Generally done in multi-tenant environments or TKGi/TAS/K8s
resource "nsxt_policy_tier1_gateway" "gateways" {
  for_each                  = local.tier1_gateways
  display_name              = each.value.display_name
  description               = each.value.description
  tier0_path                = local.tier0_gateway_path
  route_advertisement_types = each.value.route_advertisement_types
}

locals {
  tier1_gateways_output = { for gw_name, gw in nsxt_policy_tier1_gateway.gateways : (gw.display_name) => gw }
}