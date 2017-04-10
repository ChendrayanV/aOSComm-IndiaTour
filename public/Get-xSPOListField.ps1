function Get-xSPOListField {
    [Outputtype('Microsoft.SharePoint.Client.Field')]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Title
    )
    
    begin {
    }
    
    process {
        $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
        $SPOClientContext.Credentials = $SPOCredential
        $FieldCollection = $SPOClientContext.Web.Lists.GetByTitle($Title).Fields
        $SPOClientContext.Load($FieldCollection)
        $SPOClientContext.ExecuteQuery()
        $SPOClientContext.Dispose()
        foreach ($Field in $FieldCollection) {
            $Field 
        }
    }
    
    end {
    }
}