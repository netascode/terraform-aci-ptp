<!-- BEGIN_TF_DOCS -->
# PTP Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

```hcl
module "aci_ptp" {
  source  = "netascode/ptp/aci"
  version = ">= 0.0.1"

  admin_state = true
}

```
<!-- END_TF_DOCS -->