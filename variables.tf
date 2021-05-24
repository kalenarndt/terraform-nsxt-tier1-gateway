variable "tier0_gateway_path" {
  description = "Tier0 Gateway Path from the computed local"
  type        = string
  default     = null
}
variable "tier1_gateways" {
  description = "Tier1 Gateway Configuration from the supplied YAML file"
  type        = map(any)
}