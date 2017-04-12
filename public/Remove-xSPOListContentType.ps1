function Remove-xSPOListContentType {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [uri]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $Title,

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
            $ListContentTypes = $SPOClientContext.Web.Lists.GetByTitle($Title).ContentTypes
            $SPOClientContext.Load($ListContentTypes)
            $SPOClientContext.ExecuteQuery()
            $SPOClientContext.Dispose()
            for ($i = $ListContentTypes.Count - 1; $i -ge 0; $i--) {
                if ($ListContentTypes[$i].Name -eq $Name) {
                    $ListContentTypes[$i].DeleteObject()
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