param location string ='eastus'

targetScope = 'subscription'

// Création de groupe de ressource

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' ={
  name: 'rg-aicha-test'
  location: location
}
