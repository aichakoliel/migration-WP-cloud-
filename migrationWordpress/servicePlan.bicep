param location string 
param pAppServicePlan string 
param pAppService string  
param pAppInsights string 
param linuxFxVersion string 

// Création de service Plan 

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: pAppServicePlan
  kind: 'linux'
  properties: {
    reserved: true
  }
  location: location
  sku: {
    name: 'S1'
    capacity: 1
  }
}
// création de webapp App Service

resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: pAppService

  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
  
}
// Configuration de l'app service

resource webappSetting 'Microsoft.Web/sites/config@2022-03-01' = {
  name: 'web'
  parent: webApplication
properties: {
  appSettings: [
    {
      name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
      value: appInsights.properties.InstrumentationKey// integrer application insghts avec AppService
    }
    {
      name: 'key2'
      value: 'value2'
    }
  ]
}

}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: pAppInsights
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

