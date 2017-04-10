function Get-xSPOFeature {
    [CmdletBinding()]
    [Outputtype('Microsoft.SharePoint.Client.Feature')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Url,

        [Parameter(Mandatory)]
        [ValidateSet('Web' , 'Site')]
        $Scope
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            switch ($Scope) {
                "Site" {
                    $FeatureCollection = $SPOClientContext.Site.Features
                    $SPOClientContext.Load($FeatureCollection)
                    $SPOClientContext.ExecuteQuery()
                    $SPOClientContext.Dispose()
                    foreach ($Feature in $FeatureCollection) {
                        $Feature
                    }
                }

                "Web" {
                    $FeatureCollection = $SPOClientContext.Web.Features
                    $SPOClientContext.Load($FeatureCollection)
                    $SPOClientContext.ExecuteQuery()
                    $SPOClientContext.Dispose()
                    foreach ($Feature in $FeatureCollection) {
                        $Feature
                    }
                }
            }
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}