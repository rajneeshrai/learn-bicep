param pAppServicePlanWindows string
param pAppServicePlanLinux string
param pWebApplication string
param pAppInsights string

param pSqlServer string
param pSqlServerDatabase string

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
