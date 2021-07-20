## Azure Demo Infrastructure - Resource Group, Virtual Network, Subnets, Route tables, NSG's, AKS Cluster, and Nginx Ingress

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
### Part 1: Create Diagram, Resource Group, Virtual Network, Subnets, AKS Cluster, and Nginx Ingress Controller
- [X] Task 1: [Create github repository](https://github.com/wesleyemery/azure-devops-infrastruc)
- [X] Task 2: Create Azure Demo Infrastructure Diagram
- [X] Task 3: Create Resource Group
- [X] Task 4: Create Virtual Network
- [X] Task 5: Create Subnets
- [X] Task 6: Create Route Tables
- [X] Task 7: Create NSGs
- [X] Task 8: Create AKS Cluster
- [X] Task 9: Create Nodepools
- [X] Task 10: Create Nginx Ingress
- [X] Task 11: Create DNS Zone
- [X] Task 12: Create A Record
