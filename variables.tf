variable "tier1_gateway" {
  type = map(object({
    description               = optional(string)
    failover_mode             = optional(string)
    enable_firewall           = optional(bool)
    enable_standby_relocation = optional(bool)
    pool_allocation           = optional(string)
    dhcp_config_path          = optional(string)
    route_advertisement_types = optional(list(string))
    tags = optional(map(object({
      tag   = string
      scope = string
    })))
    route_advertisement_rules = optional(map(object({
      name                      = string
      action                    = string
      subnets                   = list(string)
      prefix_operator           = string
      route_advertisement_types = list(string)
    })))
  }))
  description = "(Required) Input map for creating the NSXT Tier1 Gateways"
}

variable "services" {
  type        = bool
  description = "(Optional) Conditional that allows for an edge cluster to be used with services. Set to true if you are specifying an edge cluster"
  default     = false
}

variable "edge_cluster_name" {
  type        = string
  description = "(Optional) Name of the edge cluster that will be used if you are using services. Set services to true if you are specifying an edge cluster"
  default     = ""
}

variable "tier0_gateway" {
  type        = string
  description = "(Optional) Name of the Tier0 Gateway that the Tier1 routers will be downlinked to"
  default     = ""
}

