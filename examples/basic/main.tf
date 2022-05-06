module "t1_basic" {
  source = "../../"
  tier0_gateway = "Provider-LR" # Provider Tier0 we will be downlinking to
  t1_gateway = { # Map Variable we will iterate through to create the Tier 1 Gateways
    t1_general = { # Name of the Tier 1 Gateway
      description = "Tier1 Router that provides access for general workloads" # Description that will be applied
      route_advertisement_types = ["TIER1_CONNECTED"] # The routes that we want to advertise to the Tier0
    }
    t1_dev = { # Name of the Tier 1 Gateway to be created
      description = "Tier1 Router that provides access for developer workloads" # Description that will be applied
      route_advertisement_types = ["TIER1_CONNECTED"] # The routes that we want to advertise to the Tier0
    }
    t1_prod = { # Name of the Tier 1 Gateway to be created
      description = "Tier1 Router that provides access for developer workloads" # Description that will be applied
      route_advertisement_types = ["TIER1_CONNECTED"] # The routes that we want to advertise to the Tier0
    }
  }
}

module "t1_basic_no_downlink" {
  source = "../../"
  t1_gateway = { # Map Variable we will iterate through to create the Tier 1 Gateways
    t1_general = { # Name of the Tier 1 Gateway
      description = "Tier1 Router that provides access for general workloads" # Description that will be applied
      route_advertisement_types = ["TIER1_CONNECTED"] # The routes that we want to advertise
    }
    t1_dev = { # Name of the Tier 1 Gateway to be created
      description = "Tier1 Router that provides access for developer workloads" # Description that will be applied
      route_advertisement_types = ["TIER1_CONNECTED"] # The routes that we want to advertise
    }
    t1_prod = { # Name of the Tier 1 Gateway to be created
      description = "Tier1 Router that provides access for developer workloads" # Description that will be applied
      route_advertisement_types = ["TIER1_CONNECTED"] # The routes that we want to advertise
    }
  }
}