#Import-Module bccontainerhelper;

$appProjectFolder = $Env:BUILD_SOURCESDIRECTORY -join "\*.*"
Write-Host $appProjectFolder


          
$buildsourcedir = $Env:BUILD_SOURCESDIRECTORY
Write-Host $buildsourcedir
$outputfilepath = "output"
$appOutputFile = $buildsourcedir,$outputfilepath -join "\"
Write-Host $appOutputFile
$symbolsfilepath = "symbols"
$appSymbolsFolder =  $buildsourcedir,$symbolsfilepath -join "\"
Write-Host $appSymbolsFolder


$alc=get-childitem -Path "$env:USERPROFILE\.vscode\extensions" -Recurse alc.exe |select -First 1
# Remove translation file
Get-ChildItem -path $appProjectFolder -Recurse -filter "*.g.xlf" | Remove-Item -Force
$alcParameters = @("/project:$appProjectFolder", "/packagecachepath:$appSymbolsFolder", "/out:$appOutputFile")




