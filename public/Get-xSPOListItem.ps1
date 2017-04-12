function Get-xSPOListItem {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [uri]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Title,

        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $ItemCount
    )
    
    begin {
    }
    
    process {
        $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
        $SPOClientContext.Credentials = $SPOCredential
        $List = $SPOClientContext.Web.Lists.GetByTitle($Title)
        if ($PSBoundParameters.ContainsKey('ItemCount')) {
            $Query = [Microsoft.SharePoint.Client.CamlQuery]::CreateAllItemsQuery($ItemCount)
        }
        else {
            $Query = [Microsoft.SharePoint.Client.CamlQuery]::CreateAllItemsQuery()
        }
        $ListItems = $List.GetItems($Query)
        $SPOClientContext.Load($ListItems)
        $SPOClientContext.ExecuteQuery()
        $SPOClientContext.Dispose()
        foreach ($ListItem in $ListItems) {
            [pscustomobject]@{
                Id = $ListItem['ID']
                Title = $ListItem['Title']
                Created = $ListItem['Created']
                Modified = $ListItem['Modified']
                Author = ([Microsoft.SharePoint.Client.FieldUserValue]$ListItem['Author']).LookupValue
                Editor = ([Microsoft.SharePoint.Client.FieldUserValue]$ListItem['Editor']).LookupValue
            }
        }
    }
    
    end {
    }
}