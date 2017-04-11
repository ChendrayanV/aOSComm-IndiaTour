function Search-xSPOSite {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [uri]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $QueryText
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            $KeyWordQuery = [Microsoft.SharePoint.Client.Search.Query.KeywordQuery]::new($SPOClientContext)
            $KeyWordQuery.QueryText = $QueryText
            $KeyWordQuery.RowLimit = [int]::MaxValue
            $SearchExecutor = [Microsoft.SharePoint.Client.Search.Query.SearchExecutor]::new($SPOClientContext)
            $SearchResults = $SearchExecutor.ExecuteQuery($KeyWordQuery)
            $SPOClientContext.ExecuteQuery()
            $SPOClientContext.Dispose()
            foreach ($SearchResult in $SearchResults.Value.ResultRows) {
                [pscustomobject]@{
                    Rank = '{0:N2}' -f ($Searchresult.Rank)
                    Author = $SearchResult.DisplayAuthor
                    Title = $SearchResult.Title
                    Url = $SearchResult.LinkingUrl
                }
            }
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}