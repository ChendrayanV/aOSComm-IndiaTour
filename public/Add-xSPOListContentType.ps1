function Add-xSPOListContentType {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [uri]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Title,

        [Parameter(Mandatory,ValueFromPipeline,ValueFromPipelineByPropertyName)]
        $Id
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            $List = $SPOClientContext.Web.Lists.GetByTitle($Title)
            $ContentType = $SPOClientContext.Web.ContentTypes.GetById($Id)
            $SPOClientContext.Load($ContentType)
            $SPOClientContext.Load($List)
            $SPOClientContext.Load($List.ContentTypes)
            $SPOClientContext.ExecuteQuery()
            $List.ContentTypesEnabled = $true
            $NewContentType = $List.ContentTypes.AddExistingContentType($ContentType)
            $List.Update()
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