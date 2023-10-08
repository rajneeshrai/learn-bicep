*Bicep documentation*
https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview?tabs=bicep

az deployment group create -g rg-azbicep-resourcegroup -f 2.AppServicePlan.bicep
az group delete -n rg-bicep-dev-cin -y
az deployment sub create -l centralindia -f 1.ResourceGroup.bicep

- confirm with what if
  - az deployment group -g <resource group name> -f <file name.bicep> --confirm-with-what-if
  - az deployment group -g <resource group name> -f <file name.bicep> -c

command to build and generate parameter file
az bicep build -f <file>

az deployment group create -g <group name> -f <main module file name> -p <parameters file>