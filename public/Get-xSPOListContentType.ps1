function Get-xSPOListContentType {
    [CmdletBinding()]
    [outputtype('Microsoft.SharePoint.Client.ContentType')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [uri]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $Title
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            $ContentTypeCollection = $SPOClientContext.Web.Lists.GetByTitle($Title).ContentTypes
            $SPOClientContext.Load($ContentTypeCollection)
            $SPOClientContext.ExecuteQuery()
            foreach($ContentType in $ContentTypeCollection) {
                $ContentType | Select-Object -Property ([Microsoft.SharePoint.Client.ContentType].GetProperties().Where( {$_.Propertytype -notlike "*Collection*"})).Name
            }
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}