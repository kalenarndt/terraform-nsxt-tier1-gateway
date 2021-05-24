# Terraform NSX-T Tier1 Gateway

This Terraform module creates multiple NSX-T Tier1 Gateways.

## Usage/Examples

The example below imports a yaml file and loops through the configuration as it creates tier1 gateways in the environment. Tier-0 routers are not required and default to null if a target tier-0 router isn't specified for the module call. 


```hcl
# Input Variables
locals {
  nsxt_config                        = yamldecode(file("${path.module}/nsxt-config.yaml"))
  target_tier0_gateway_name          = "t0-ecmp"
  tier1_gateways                     = local.nsxt_config.tier1_gateways
}


# module to configure Tier1 Gateways on a specific Tier 0 
module "tier1_gateway" {
  source             = "github.com/kalenarndt/terraform-nsxt-tier1-gateway"
  tier0_gateway_path = local.tier0_gateway_paths[local.target_tier0_gateway_name]
  tier1_gateways     = local.tier1_gateways
}


# Computed Locals
# modified object outputs from modules to be referenced by others. 
locals {
  tier1_gateway_objs                 = module.tier1_gateway.tier1_gateways
  tier1_gateway_paths                = { for gw_name, gateway in local.tier1_gateway_objs : (gw_name) => gateway.path }
}
```

Ensure that you modify the nsxt-config.yaml file to match the objects that you would like to deploy as this is what the module uses to deploy and configure the tier1 gateways.

Place the nsxt-config.yaml file where your main.tf file is in your deployment or modify the usage example for the path to your yaml I

```yaml
# tier1 gateway section.
tier1_gateways:
  t1-ops:
    display_name: "t1-operations"
    route_advertisement_types:
      - "TIER1_STATIC_ROUTES"
      - "TIER1_CONNECTED"
    description: Tier1 Gateway for Operations  - Created by Terraform
```

  
## License

[MIT](https://choosealicense.com/licenses/mit/)

  




<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_nsxt"></a> [nsxt](#requirement\_nsxt) |  >=3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nsxt"></a> [nsxt](#provider\_nsxt) |  >=3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [nsxt_policy_tier1_gateway.gateways](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier1_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tier0_gateway_path"></a> [tier0\_gateway\_path](#input\_tier0\_gateway\_path) | Tier0 Gateway Path from the computed local | `string` | null | yes |
| <a name="input_tier1_gateways"></a> [tier1\_gateways](#input\_tier1\_gateways) | Tier1 Gateway Configuration from the supplied YAML file | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tier1_gateways"></a> [tier1\_gateways](#output\_tier1\_gateways) | Tier 1 Gateway output object to use with other modules. |
<!-- END_TF_DOCS -->