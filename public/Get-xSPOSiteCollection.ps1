function Get-xSPOSiteCollection {
    [CmdletBinding()]
    [Outputtype('Microsoft.Online.SharePoint.TenantAdministration.SiteProperties')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Url
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            $SPOTenant = [Microsoft.Online.SharePoint.TenantAdministration.Tenant]::new($SPOClientContext)
            $SiteCollections = $SPOTenant.GetSiteProperties(0, $true)
            $SPOClientContext.Load($SiteCollections)
            $SPOClientContext.ExecuteQuery()
            $SPOClientContext.Dispose()
            foreach ($SiteCollection in $SiteCollections) {
                $SiteCollection 
            }  
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}