function Get-xSPOApp {
    [CmdletBinding()]
    [Outputtype('Microsoft.Online.SharePoint.TenantAdministration.AppInfo')]
    param (
        [Parameter(Mandatory)]
        $Url
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            $SPOTenant = [Microsoft.Online.SharePoint.TenantAdministration.Tenant]::new($SPOClientContext)
            $SPOTenant.Context.Load($SPOTenant)
            $SPOTenant.Context.ExecuteQuery()
            $AppCollection = $SPOTenant.GetAppInfoByName([string]::Empty)
            $SPOClientContext.Load($AppCollection)
            $SPOClientContext.ExecuteQuery()
            $SPOClientContext.Dispose()
            foreach ($App in $AppCollection) {
                $App 
            }
        }
        catch {
            $_.Exception.Message 
        }
    }
    
    end {
    }
}