resource "aci_rest" "latencyPtpMode" {
  dn         = "uni/fabric/ptpmode"
  class_name = "latencyPtpMode"
  content = {
    state = var.admin_state == true ? "enabled" : "disabled"
  }
}
