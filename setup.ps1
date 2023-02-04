If((Get-AzContext).Name.Length -lt 1){Connect-AzAccount}
$tenantId = (Get-AzContext).Tenant.Id
If ($tenantId.Length -gt 0) {
    $tenantId
}
Else {
    Write-Host "No Azure Login exists"
    Start-Sleep 10
    Exit
}

$LOCATION = "westus2"
$RESOURCE_GROUP_NAME = 'rg-st-tf-dev-westus2-01'
$STORAGE_ACCOUNT_NAME = "sttfstatedevwestus201"
$CONTAINER_NAME = 'tfstate'

# AzResourceGroup
Get-AzResourceGroup -Name $RESOURCE_GROUP_NAME -ErrorVariable notPresent -ErrorAction SilentlyContinue
If ($notPresent) {
    New-AzResourceGroup -Name $RESOURCE_GROUP_NAME -Location $LOCATION
    $notPresent = $null
}
Else { Write-Host "$RESOURCE_GROUP_NAME already exists" }

# AzStorageAccount
$storageAccount = Get-AzStorageAccount -ResourceGroupName $RESOURCE_GROUP_NAME -Name $STORAGE_ACCOUNT_NAME -ErrorVariable notPresent -ErrorAction SilentlyContinue
If ($notPresent){
    $storageAccount = New-AzStorageAccount -ResourceGroupName $RESOURCE_GROUP_NAME -Name $STORAGE_ACCOUNT_NAME -SkuName Standard_LRS -Location $LOCATION -AllowBlobPublicAccess $true
    $notPresent = $null
}

Get-AzStorageContainer -Name $CONTAINER_NAME -ErrorVariable notPresent -ErrorAction SilentlyContinue
If ($notPresent){
    New-AzStorageContainer -Name $CONTAINER_NAME -Context $storageAccount.context -Permission blob
    $notPresent = $null
}

$ACCOUNT_KEY = (Get-AzStorageAccountKey -ResourceGroupName $RESOURCE_GROUP_NAME -Name $STORAGE_ACCOUNT_NAME)[0].value
$env:ARM_ACCESS_KEY = $ACCOUNT_KEY