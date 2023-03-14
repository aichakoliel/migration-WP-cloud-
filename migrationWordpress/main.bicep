param pAppServicePlan string = 'ApSPlan-test-aicha'
param pAppService string = 'WebApp-test-aicha'
param pAppInsights string = 'appInsights-test-aicha'
param location string ='eastus'
param linuxFxVersion string = 'node|14-lts'
param virtualNetworkName string = 'vnet-test-aicha'
param vnetAddressPrefix string = '10.0.0.0/16'
param subnetName string = 'subnet-test-aicha'
param subnetPrefix string = '10.0.0.0/16'
param pSQLServer string = 'sqlservertest'
param skuName string = 'Standard_B1ms'
param SkuTier string = 'Burstable'
param mysqlVersion string = '14'
param administratorLogin string = 'sqladmin'
param administratorLoginPassword string = 'Test@1234'
param backupRetentionDays int = 7
param geoRedundantBackup string = 'Disabled'


module AppServicePlan 'servicePlan.bicep' = {
  name: 'AppServicePlan' 
  params: {
    location: location
    pAppInsights: pAppInsights
    pAppService: pAppService
    pAppServicePlan: pAppServicePlan
    linuxFxVersion: linuxFxVersion
  }

}

module SQLServer 'SQlData.bicep' = {
  name: 'sql'
  params: {
    location: location
    pSQLServer: pSQLServer
    administratorLogin: administratorLogin
    administratorLoginPassword:administratorLoginPassword
    backupRetentionDays: backupRetentionDays
    geoRedundantBackup: geoRedundantBackup
    mysqlVersion: mysqlVersion
    skuName: skuName
    SkuTier: SkuTier
  }
}

module virtualNetwork 'virtualNetwork.bicep' = {
  name: 'virtualnetwork'
  params: {
    location: location
    subnetName: subnetName 
    subnetPrefix: subnetPrefix 
    virtualNetworkName: virtualNetworkName
    vnetAddressPrefix: vnetAddressPrefix
  }
}






