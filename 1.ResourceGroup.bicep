@description('Specifies the location for resources.')
param centralindia string = 'centralindia'
param eastus string = 'eastus'
param southindia string = 'southindia'

@description('Specifies the name for resource group')
param rgNameDev string = 'rg-azbicep-dev-resourcegroup'
param rgNameSit string = 'rg-azbicep-sit-resourcegroup'
param rgNameStg string = 'rg-azbicep-stg-resourcegroup'

targetScope = 'subscription'

resource azBicepDevResourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgNameDev
  location: centralindia
}

resource azBicepSitResourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgNameSit
  location: eastus
}

resource azBicepStgResourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgNameStg
  location: southindia
}
