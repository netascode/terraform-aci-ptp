terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  admin_state = true
}

data "aci_rest" "latencyPtpMode" {
  dn = "uni/fabric/ptpmode"

  depends_on = [module.main]
}

resource "test_assertions" "latencyPtpMode" {
  component = "latencyPtpMode"

  equal "state" {
    description = "state"
    got         = data.aci_rest.latencyPtpMode.content.state
    want        = "enabled"
  }
}
