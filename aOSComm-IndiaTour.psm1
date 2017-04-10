#region - Load the required assemblies
$Assemblies = @(Get-ChildItem -Path $PSScriptRoot\Assemblies\*.dll -ErrorAction SilentlyContinue)
foreach($Assembly in $Assemblies) {
    try {
        Import-Module $Assembly -Verbose
    }
    catch {
        Write-Error -Message "Failed to load assemblies $($Assembly.FullName): $_"
    }
}
#endregion

#region - Load the functions
$Public = @(Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue)
$WorkInProgress = @(Get-ChildItem -Path $PSScriptRoot\WorkInProgress\*.ps1 -ErrorAction SilentlyContinue)
foreach ($import in @($Public)) {
    try {
        . $import.fullname
    }
    catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}
Export-ModuleMember -Function $Public.Basename -Alias *