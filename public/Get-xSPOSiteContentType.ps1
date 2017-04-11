function Get-xSPOSiteContentType {
    [CmdletBinding()]
    [outputtype('Microsoft.SharePoint.Client.ContentType')]
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
            $ContentTypes = $SPOClientContext.Web.ContentTypes 
            $SPOClientContext.Load($ContentTypes)
            $SPOClientContext.ExecuteQuery()
            $SPOClientContext.Dispose()
            $ContentTypes | Select-Object ([Microsoft.SharePoint.Client.ContentType].GetProperties().Where({$_.Propertytype -notlike "*Collection*"})).Name
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}