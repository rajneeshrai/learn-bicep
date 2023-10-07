// Example of creating app service plan

param pAppServicePlanWindows string
param pAppServicePlanLinux string
param pWebApplication string
param pAppInsights string

resource appServicePlanWindows 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: pAppServicePlanWindows
  location: resourceGroup().location
  sku: {
    name: 'F1'
    capacity: 1
  }
}
resource appServicePlanLinux 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: pAppServicePlanLinux
  kind: 'linux'
  properties: {
    reserved: true
  }
  location: resourceGroup().location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: pWebApplication
  location: resourceGroup().location
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', pAppServicePlanWindows)
  }
  dependsOn: [
    appServicePlanWindows
  ]
}

resource webApplicationAppSetings 'Microsoft.Web/sites/config@2022-09-01' = {
  name: 'web'
  parent: webApplication
  properties: {
    appSettings: [
      {
        name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
        value: appInsights.properties.InstrumentationKey
      }
      {
        name: 'key2'
        value: 'value2'
      }
      {
        name: 'WEBSITE_NODE_DEFAULT_VERSION'
        value: '6.9.1'
      }
    ]
  }
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: pAppInsights
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}
