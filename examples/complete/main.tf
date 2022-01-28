module "aci_ptp" {
  source  = "netascode/ptp/aci"
  version = ">= 0.1.0"

  admin_state = true
}
