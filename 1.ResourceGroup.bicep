@description('Specifies the location for resources.')
param location string = 'centralindia'

@description('Specifies the name for resource group')
param rgName string = 'rg-azbicep-resourcegroup'

targetScope = 'subscription'

resource azbicepresourcegroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgName
  location: location
}
