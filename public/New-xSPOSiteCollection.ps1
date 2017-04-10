function New-xSPOSiteCollection {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline)]
        $SiteUrl,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateSet('STS#0' , 'STS#1')]
        $Template,

        [Parameter()]
        $Owner,

        [Parameter()]
        $Description
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            $SPOTenant = [Microsoft.Online.SharePoint.TenantAdministration.Tenant]::new($SPOClientContext)
            $SiteCreationProperties = [Microsoft.Online.SharePoint.TenantAdministration.SiteCreationProperties]::new()
            switch ($Template) {
                "STS#0" {
                    $SiteCreationProperties.Template = "STS#0"
                    $SiteCreationProperties.Owner = $Owner
                    $SiteCreationProperties.StorageMaximumLevel = 100
                    $SiteCreationProperties.UserCodeMaximumLevel = 50
                    $SiteCreationProperties.Url = $SiteUrl
                }
                "STS#1" {
                    $SiteCreationProperties.Template = "STS#1"
                    $SiteCreationProperties.Owner = $Owner
                    $SiteCreationProperties.StorageMaximumLevel = 100
                    $SiteCreationProperties.UserCodeMaximumLevel = 50
                    $SiteCreationProperties.Url = $SiteUrl
                }
                default {
                    Write-Information -MessageData "Do Refer the online help for valid site template Id's!" -InformationAction Continue 
                }
            }
            $SPOTenant.CreateSite($SiteCreationProperties)
            $SPOClientContext.Load($SPOTenant)
            $SPOClientContext.ExecuteQuery()
            $SPOClientContext.Dispose()
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}
