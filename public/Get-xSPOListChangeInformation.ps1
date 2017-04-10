function Get-xSPOListChangeInformation {
    [CmdletBinding()]
    [outputtype('Microsoft.SharePoint.Client.ChangeList', 'Microsoft.SharePoint.Client.ChangeFolder', 
        'Microsoft.SharePoint.Client.ChangeView' , 'Microsoft.SharePoint.Client.ChangeFile',
        'Microsoft.SharePoint.Client.ChangeItem')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Title
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            $List = $SPOClientContext.Web.Lists.GetByTitle($Title)
            $SPOClientContext.Load($List)
            $ChangeQuery = [Microsoft.SharePoint.Client.ChangeQuery]::new($true, $true)
            $ListChanges = $List.GetChanges($ChangeQuery)
            $SPOClientContext.Load($ListChanges)
            $SPOClientContext.ExecuteQuery()
            $SPOClientContext.Dispose()
            foreach ($change in $ListChanges) {
                $change 
            }
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}