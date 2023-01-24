terraform {
  required_version = ">= 1.0.0"

  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
}

module "main" {
  source = "../.."

  admin_state       = true
  global_domain     = 0
  profile           = "aes67"
  announce_interval = 1
  announce_timeout  = 3
  sync_interval     = -3
  delay_interval    = -2
}

data "aci_rest_managed" "latencyPtpMode" {
  dn = "uni/fabric/ptpmode"

  depends_on = [module.main]
}

resource "test_assertions" "latencyPtpMode" {
  component = "latencyPtpMode"

  equal "state" {
    description = "state"
    got         = data.aci_rest_managed.latencyPtpMode.content.state
    want        = "enabled"
  }

  equal "global_domain" {
    description = "global_domain"
    got         = data.aci_rest_managed.latencyPtpMode.content.global_domain
    want        = "0"
  }

  equal "profile" {
    description = "profile"
    got         = data.aci_rest_managed.latencyPtpMode.content.profile
    want        = "aes67"
  }

  equal "announce_interval" {
    description = "announce_interval"
    got         = data.aci_rest_managed.latencyPtpMode.content.announce_interval
    want        = "1"
  }

  equal "announce_timeout" {
    description = "announce_timeout"
    got         = data.aci_rest_managed.latencyPtpMode.content.announce_timeout
    want        = "1"
  }

  equal "sync_interval" {
    description = "sync_interval"
    got         = data.aci_rest_managed.latencyPtpMode.content.sync_interval
    want        = "-3"
  }

  equal "delay_interval" {
    description = "delay_interval"
    got         = data.aci_rest_managed.latencyPtpMode.content.delay_interval
    want        = "-2"
  }
}
