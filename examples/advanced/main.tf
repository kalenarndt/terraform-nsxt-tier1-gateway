# Please see https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier1_gateway for all the available options for the inputs on this module and what the NSX-T API expects

module "t1_services" {
  source            = "kalenarndt/tier1-gateway/nsxt"
  services          = true
  edge_cluster_name = "edge-cluster"
  tier0_gateway     = "Provider-LR"                                                         # Provider Tier0 we will be downlinking to
  tier1_gateway = {                                                                         # Map Variable we will iterate through to create the Tier 1 Gateways
    t1_general = {                                                                          # Name of the Tier 1 Gateway
      description               = "Tier1 Router that provides access for general workloads" # Description that will be applied
      route_advertisement_types = ["TIER1_CONNECTED", "TIER1_STATIC_ROUTES"]                # The routes that we want to advertise to the Tier0
      pool_allocation           = "LB_LARGE"                                                # Size for service allocation
      failover_mode             = "PREEMPTIVE"                                              # Failover mode to use
      enable_standby_relocation = true                                                      # Boolean if we want to relocate the standby SR

      tags = { # Tag map that we iterate through and apply to the Tier 1. Both Tag and Scope are required unless you set the one you want to ""
        prod = {
          tag   = "services"
          scope = "prod"
        }
        lb = {
          tag   = "lb"
          scope = ""
        }
      }

      route_advertisement_rules = { # Map of the route advertisement rules that we want to create on the Tier1
        rule_1 = {
          name                      = "filtering"         # name of the rule to create
          action                    = "DENY"              # Action that we want to take
          subnets                   = ["172.100.0.0/16"]  # Subnets that are impacted by the rule
          prefix_operator           = "GE"                # Prefix operator
          route_advertisement_types = ["TIER1_CONNECTED"] # Advertisement Types
        }
      }
    }
  }
}
