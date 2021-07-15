## Azure Demo Infrastructure - Resource Group, Virtual Network, Subnets, AKS Cluster, and Nginx Ingress

Below is a diagram of the solution architecture we are building towards. This visual allows us to understand the whole of the solution as we are working on the various components.

### ![Azure-Demo-Architecture](./images/mbs-dev.png)

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
This command will deploy the Resource Groups, ACR, and VNets.

These steps can also be completed through the TFE console: https://tfe.lnrisk.io/

## Steps Completed
### Part 1: Create Diagram, Resource Group, Virtual Network, Subnets, AKS Cluster, and Nginx Ingress Controller
- [ ] Task 1: [Create github repository](https://github.com/wesleyemery/azure-devops-infrastruc)
- [ ] Task 2: Create Azure Demo Infrastructure Diagram
- [ ] Task 3: Create Resource Group
- [ ] Task 4: Create Virtual Network
- [ ] Task 5: Create Subnets
- [ ] Task 6: Create AKS Cluster
- [ ] Task 7: Create Nginx Ingress

