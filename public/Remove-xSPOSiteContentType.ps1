function Remove-xSPOSiteContentType {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [uri]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $Name
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            $ContentTypeCollection = $SPOClientContext.Web.ContentTypes
            $SPOClientContext.Load($ContentTypeCollection)
            $SPOClientContext.ExecuteQuery()
            $SPOClientContext.Dispose()
            for ($i = $ContentTypeCollection.Count - 1; $i -ge 0; $i--) {
                if ($ContentTypeCollection[$i].Name -eq $Name) {
                    $ContentTypeCollection[$i].DeleteObject()
                }
            }
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