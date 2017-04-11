function Add-xSPOListItem {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, Position = 0)]
        [uri]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, Position = 1)]
        [string]
        $Title,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, Position = 2)]
        [string]
        $ItemTitle,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName, Position = 3)]
        [string]
        $Announcement
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            $List = $SPOClientContext.Web.Lists.GetByTitle($Title)
            $ListItemCreationInformation = [Microsoft.SharePoint.Client.ListItemCreationInformation]::new()
            $ListItem = $List.AddItem($ListItemCreationInformation)
            $ListItem["Title"] = $ItemTitle
            $ListItem["Body"] = $Announcement
            $ListItem.Update()
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
