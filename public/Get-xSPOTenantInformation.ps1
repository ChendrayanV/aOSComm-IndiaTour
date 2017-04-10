function Get-xSPOTenantInformation {
    [CmdletBinding()]
    [Outputtype('Microsoft.Online.SharePoint.TenantAdministration.Tenant')]
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
            $SPOClientContext.Load($SPOTenant)
            $SPOClientContext.ExecuteQuery()
            $SPOClientContext.Dispose()
            $SPOTenant
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}