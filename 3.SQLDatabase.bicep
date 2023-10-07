resource sqlServer 'Microsoft.Sql/servers@2021-11-01' = {
  name: 'azbicep-dev-sqlserver'
  location: resourceGroup().location
  properties: {
    administratorLogin: 'superadmin'
    administratorLoginPassword: 'Test@123'
  }
}

resource sqlServerFirewallRules 'Microsoft.Sql/servers/firewallRules@2021-11-01' = {
  parent: sqlServer
  name: 'Rajneesh\'s ip address'
  properties: {
    startIpAddress: '1.1.1.1'
    endIpAddress: '1.1.1.1'
  }
}


resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2021-11-01' = {
  parent: sqlServer
  name: 'database1'
  location: resourceGroup().location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: '34359738368'
    requestedServiceObjectiveName: 'Basic'
  }
}
