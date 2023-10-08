param pAppServicePlanWindows string = 'azbicep-centralindia-dev-windows-asp'
param pAppServicePlanLinux string = 'azbicep-centralindia-dev-linux-asp'
param pWebApplication string = 'azbicep-centralindia-dev-wapp-46dg63dh42'
param pAppInsights string = 'azbicep-centralindia-dev-wapp-46dg63dh42-ai'

param pSqlServer string = 'azbicep-centralindia-dev-sqlserver'
param pSqlServerDatabase string = 'database1'

module AppServicePlan '2.AppServicePlan.bicep' = {
  name: 'AppServicePlan'
  params: {
    pAppServicePlanLinux: pAppServicePlanLinux
    pAppServicePlanWindows: pAppServicePlanWindows
    pWebApplication: pWebApplication
    pInstrumentationKey: AppInsights.outputs.oInstrumentationKey
  }
}

module AppInsights '4.AppInsights.bicep' = {
  name: 'AppInsights'
  params: {
    pAppInsights: pAppInsights
  }
}

module SQLDatabase '3.SQLDatabase.bicep' = {
  name: 'SQLDatabase'
  params: {
    pSqlServer: pSqlServer
    pSqlServerDatabase: pSqlServerDatabase
  }
}
