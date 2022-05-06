provider "nsxt" {
  host                 = "192.168.110.41"
  username             = "admin"
  password             = "default"
  allow_unverified_ssl = true
  max_retries          = 2
}