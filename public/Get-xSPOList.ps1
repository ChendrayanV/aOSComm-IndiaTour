function Get-xSPOList {
    [CmdletBinding()]
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
            $ListCollection = $SPOClientContext.Web.Lists
            $SPOClientContext.Load($ListCollection)
            $SPOClientContext.ExecuteQuery()
            $SPOClientContext.Dispose()
            foreach ($List in $ListCollection) {
                $List | Select-Object -Property ([Microsoft.SharePoint.Client.List].GetProperties().Where( {$_.Propertytype -notlike "*Collection*"})).Name
            }
            
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}