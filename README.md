
![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

## Azure Demo Infrastructure 

### Diagram
![Alt text](docs/demoDiagram.png?raw=true "Infrastructure Diagram")

### Deployment
The steps in deploying the newly configured infrastructure are to run:
```
terraform plan
```
to test the configuration that is being passed in. If this step fails, look at the error and search for syntax issues in the referenced file and make sure all spaces and tabs are correct. Continue to rerun command until the plan passes as it will as fail in the apply as well.

Once the plan command has passed run:
```
terraform apply
```

## Steps Completed
### Part 1: Create Infrastructure:

- [X] Task 1: [Create github repository](https://github.com/wesleyemery/azure-devops-infrastructure)
- [X] Task 2: Create Azure Demo Infrastructure Diagram
- [X] Task 3: Create Resource Group
- [X] Task 4: Create Virtual Network
- [X] Task 5: Create Subnets
- [X] Task 6: Create Route Tables
- [X] Task 7: Create NSGs
- [X] Task 8: Create AKS Cluster
- [X] Task 9: Create Public and Private Nodepool
- [X] Task 10: Create Nginx Ingress
- [X] Task 11: Create DNS Zone
- [X] Task 12: Create A Record
- [X] Task 13: Create ArgoCD Deployment

### Part 2: Deploy Guestbook Application:
- [X] Task 1: [Create github repository](https://github.com/wesleyemery/azure-devops-app.git)
- [X] Task 2: Create Redis Helm Chart
- [X] Task 3: Create Guestbook Helm Chart
- [X] Task 4: Deploy to cluster using ArgoCD

<!--- BEGIN_TF_DOCS --->
## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.57 |
| kubernetes | >=2.0.0 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| create\_namespace | Boolean to create namespace | `bool` | `false` | no |
| dns\_name | DNS name | `string` | n/a | yes |
| names | Names to be applied to resources (inclusive) | <pre>object({<br>    environment         = string<br>    location            = string<br>    market              = string<br>    business_unit       = string<br>    product_name        = string<br>    project             = string<br>    product_group       = string<br>    resource_group_type = string<br>    subscription_type   = string<br>    resource_group_type = string<br>    subscription_id     = string<br><br>  })</pre> | n/a | yes |
| namespace | Namespace for ingress controller | `string` | n/a | yes |
| parent\_domain | pre-existing parent domain in which to create the NS record for the child domain | `string` | n/a | yes |
| sku | The SKU name of the container registry. Possible values are Basic, Standard and Premium | `string` | `"Basic"` | no |

## Outputs

| Name | Description |
|------|-------------|
| aks\_login | n/a |
<!--- END_TF_DOCS --->
