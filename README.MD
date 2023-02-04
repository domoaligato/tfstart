# Getting Started with Hashicorp Terraform in Azure

To get started with this repo...
1. Install [vscode](https://code.visualstudio.com/download)
1. Install [git for windows.](https://gitforwindows.org/)
1. Install [terraform cli.](https://developer.hashicorp.com/terraform/downloads)
1. Open Powershell core and connect to Azure.

    `Connect-AzAccount`
1. create a folder for your code projects

    ```powershell
    New-Item -Path ([Environment]::GetFolderPath("MyDocuments")) -Name "code" -ItemType "directory"
    cd ([Environment]::GetFolderPath("MyDocuments"))
    cd .\code\```
1. `git clone https://github.com/domoaligato/tfstart.git`

1. Run Setup.ps1 (not in pwsh ise)
1. `cd .\tfstart`
1. Install the offical vscode extensions below
>*  Azure Resource Manager
>*  Azure Terraform
>*  Bicep
>*  Hashicorp Terraform
>*  Powershell