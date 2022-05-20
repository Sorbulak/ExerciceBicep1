@maxLength(24)
@minLength(10)
param storageAccountName string


param location string = resourceGroup().location
param storageAccountSkuName string

var webappsNames = [
  'webapp1'
  'webapp2'
  'webapp3'
]
var appServiceNames = 'exercice-bicep-plan'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

module webapps 'modules/webappsmodule.bicep' = {
  name: 'webappsmodule'
  params: {
    location: location
    appServicePlanName: appServiceNames
    appServiceNames: webappsNames
  }
}


