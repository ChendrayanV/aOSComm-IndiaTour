function Get-xSPORecycleBinItem {
    [CmdletBinding()]
    [outputtype('Microsoft.SharePoint.Client.RecycleBinItem')]
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
            $Web = $SPOClientContext.Web
            $RecycleBinItems = $Web.GetRecycleBinItems($null, 1000,
                $false, [Microsoft.SharePoint.Client.RecycleBinOrderBy]::DefaultOrderBy,
                [Microsoft.SharePoint.Client.RecycleBinItemState]::FirstStageRecycleBin)
            $SPOClientContext.Load($RecycleBinItems)
            $SPOClientContext.ExecuteQuery()
            $SPOClientContext.Dispose()
            foreach ($RecycleBinItem in $RecycleBinItems) {
                $RecycleBinItem
            }
        }
        catch {

        }
    }
    
    end {
    }
}
