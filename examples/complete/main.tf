module "aci_ptp" {
  source  = "netascode/ptp/aci"
  version = ">= 0.0.1"

  admin_state = true
}
