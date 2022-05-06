# terraform-nsxt-tier1-gateway

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_nsxt"></a> [nsxt](#requirement\_nsxt) | >=3.2.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nsxt"></a> [nsxt](#provider\_nsxt) | 3.2.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [nsxt_policy_tier1_gateway.t1](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier1_gateway) | resource |
| [nsxt_policy_edge_cluster.ec](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/data-sources/policy_edge_cluster) | data source |
| [nsxt_policy_tier0_gateway.t0](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/data-sources/policy_tier0_gateway) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_edge_cluster_name"></a> [edge\_cluster\_name](#input\_edge\_cluster\_name) | (Optional) Name of the edge cluster that will be used if you are using services. Set services to true if you are specifying an edge cluster | `string` | `""` | no |
| <a name="input_services"></a> [services](#input\_services) | (Optional) Conditional that allows for an edge cluster to be used with services. Set to true if you are specifying an edge cluster | `bool` | `false` | no |
| <a name="input_tier0_gateway"></a> [tier0\_gateway](#input\_tier0\_gateway) | (Optional) Name of the Tier0 Gateway that the Tier1 routers will be downlinked to | `string` | `""` | no |
| <a name="input_tier1_gateway"></a> [tier1\_gateway](#input\_tier1\_gateway) | (Required) Input map for creating the NSXT Tier1 Gateways | <pre>map(object({<br>    description               = optional(string)<br>    failover_mode             = optional(string)<br>    enable_firewall           = optional(bool)<br>    enable_standby_relocation = optional(bool)<br>    pool_allocation           = optional(string)<br>    dhcp_config_path          = optional(string)<br>    route_advertisement_types = optional(list(string))<br>    tags = optional(map(object({<br>      tag   = string<br>      scope = string<br>    })))<br>    route_advertisement_rules = optional(map(object({<br>      name                      = string<br>      action                    = string<br>      subnets                   = list(string)<br>      prefix_operator           = string<br>      route_advertisement_types = list(string)<br>    })))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tier1_gateway"></a> [tier1\_gateway](#output\_tier1\_gateway) | Output of the Tier1 Gateway that was created. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
