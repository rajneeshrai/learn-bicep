param pAppInsights string

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: pAppInsights
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

output oInstrumentationKey string = appInsights.properties.InstrumentationKey
