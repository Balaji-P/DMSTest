Set-ExecutionPolicy unrestricted
$appProjectFolder = $Env:BUILD_SOURCESDIRECTORY
Write-Host $appProjectFolder
$serverInstance='CAP-BC_sandbox'

#alc.exe /project:C:\Temp\AL\TestProject /packagecachepath:C:\Temp\AL\TestProject\symbols

#C:\DMS_Test\ALC\bin\alc.exe /project:C:\DMS_Test\CICDTest  /out:C:\DMS_Test\*.app  /packagecachepath:C:\DMS_Test\CICDTest\.alPackages

.\ALC\bin\alc.exe /project:. /out:.\CICDTest\Demo.app /packagecachepath:.\CICDTest\.alPackages

 $appFile = (Get-Item  (".\CICDTest\Demo.app")).FullName

 #[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

 #Install-PackageProvider -Name Nuget

 #Import-Module "$env:ProgramFiles\Microsoft Dynamics NAV\180\Service\NavAdminTool.ps1"


 #Publish-AppToDevEndPoint -appFile $appFile -credential $credential -devEndpointUri "http:\\localhost" -devPort 7049 -instanceName CAP-BC-Sandbox

 #Import-Module 'C:\Program Files\Microsoft Dynamics NAV\90\Service\NavAdminTool.ps1' -WarningAction SilentlyContinue | Out-Null
 
#Import-Module "C:\Program Files\Microsoft Dynamics 365 Business Central\180\Service\NavAdminTool.ps1"

 #Install-NAVApp -ServerInstance $serverInstance -Name 'Demo App' -Version 2.3.4.500 -Tenant '13588042-fe43-45bb-8ce1-83b2e6dd126c' -DoNotLoadData

 #Write-Host "Publishing $([System.IO.Path]::GetFileName($appFile))"
 #Publish-NavApp -ServerInstance 'BC' -path $appFile -skipVerification:$skipVerification -packageType Extension




Write-Host $appProjectFolder

Import-Module ".\CICDTest\scripts\NavAdminTool.ps1"


#Write-Host $appProjectFolder


#$ALCpath = 'CICDTest'

#$ALC = 'alc.exe'
#$AL = 'ALC'

#$appProjectFolder,$ALCpath,$AL,$ALC -join "\" /project:. /out:. \Demo.app /packagecachepath:.\AlPackages

ls

$secpasswd = ConvertTo-SecureString "Ck6AFosfXnICSoth3lB5JCUTHkHMu9H8mLc5xCreZEE" -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ("CAP-BC-Admin@avanadeD365.onmicrosoft.com", $secpasswd)
$appFile = (Get-Item  (".\CICDTest\Demo.app")).FullName


Write-Host $secpasswd
Write-Host $mycreds
Write-Host $appFile

#Invoke-WebRequest `
##            -Method Patch `
 #           -Uri "https://api.businesscentral.dynamics.com/v2.0/CAP-BC-Sandbox/api/microsoft/automation/v2.0/companies(13588042-fe43-45bb-8ce1-83b2e6dd126c)/extensionUpload(0)/content"
 #           -Credential $mycreds `
 #           -ContentType "application/octet-stream" `
  #          -Headers @{"If-Match" = "*"}`
  #          -InFile $appFile | Out-Null

Start-Sleep -s 10 			 