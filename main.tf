data "nsxt_policy_tier0_gateway" "t0" {
  count        = length(var.tier0_gateway) >= 1 ? 1 : 0
  display_name = var.tier0_gateway
}

data "nsxt_policy_edge_cluster" "ec" {
  count        = var.services ? 1 : 0
  display_name = var.edge_cluster_name
}

resource "nsxt_policy_tier1_gateway" "t1" {
  for_each                  = var.tier1_gateway
  display_name              = each.key
  description               = each.value.description
  edge_cluster_path         = var.services ? data.nsxt_policy_edge_cluster.ec[0].path : null
  tier0_path                = length(var.tier0_gateway) >= 1 ? data.nsxt_policy_tier0_gateway.t0[0].path : null
  failover_mode             = each.value.failover_mode
  enable_firewall           = each.value.enable_firewall
  enable_standby_relocation = var.services ? each.value.enable_standby_relocation : false
  pool_allocation           = var.services ? each.value.pool_allocation : null
  dhcp_config_path          = each.value.dhcp_config_path
  route_advertisement_types = each.value.route_advertisement_types

  dynamic "tag" {
    for_each = var.tier1_gateway[each.key].tags != null ? var.tier1_gateway[each.key].tags : {}
    content {
      tag   = tag.value.tag
      scope = tag.value.scope
    }
  }

  dynamic "route_advertisement_rule" {
    for_each = var.tier1_gateway[each.key].route_advertisement_rules != null ? var.tier1_gateway[each.key].route_advertisement_rules : {}
    iterator = rule
    content {
      name                      = rule.value.name
      action                    = rule.value.action
      subnets                   = rule.value.subnets
      prefix_operator           = rule.value.prefix_operator
      route_advertisement_types = rule.value.route_advertisement_types
    }
  }
}
