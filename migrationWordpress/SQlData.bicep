param pSQLServer string 
param location string
param skuName string 
param SkuTier string  
param mysqlVersion string
param administratorLogin string
param administratorLoginPassword string 
param backupRetentionDays int 
param geoRedundantBackup string 



resource flexibleServers_aichatest_name_resource 'Microsoft.DBforPostgreSQL/flexibleServers@2022-12-01' = {
  name: pSQLServer
  location: location
  sku: {
    name: skuName
    tier: SkuTier
  }
  properties: {
    authConfig: {
      activeDirectoryAuth: 'Disabled'
      passwordAuth: 'Enabled'
    }
    dataEncryption: {
      type: 'SystemManaged'
    }
    version: mysqlVersion
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    availabilityZone: '3'
    storage: {
      storageSizeGB: 32
    }
    backup: {
      backupRetentionDays: backupRetentionDays
      geoRedundantBackup: geoRedundantBackup
    }
    network: {
    }
    highAvailability: {
      mode: 'Disabled'
    }
    maintenanceWindow: {
      customWindow: 'Disabled'
      dayOfWeek: 0
      startHour: 0
      startMinute: 0
    }
    replicationRole: 'Primary'
    replicaCapacity: 5
  }
}
