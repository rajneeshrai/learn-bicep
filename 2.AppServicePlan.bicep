// Example of creating app service plan

@description('The app service plan name')
param name string = 'azbicep-dev-asp1'

resource appServicePlanWindows 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: name
  location: resourceGroup().location
  sku: {
    name: 'F1'
    capacity: 1
  }
}
resource appServicePlanLinux 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: 'azbicep-dev-linux-asp1'
  kind: 'linux'
  properties:{
    reserved:true
  }
  location: resourceGroup().location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: 'azbicep-dev-wapp1-46dg63dh42'
  location: resourceGroup().location
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms',name)
  }
  dependsOn: [
    appServicePlanWindows
  ]
}

resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: 'azbicep-dev-wapp1-46dg63dh42-ai'
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

