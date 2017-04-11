function Get-xSPORoleDefinition {
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
            $RoleDefinitions = $SPOClientContext.Web.RoleDefinitions
            $SPOClientContext.Load($RoleDefinitions)
            $SPOClientContext.ExecuteQuery()
            $SPOClientContext.Dispose()
            foreach($RoleDefinition in $RoleDefinitions) {
                $RoleDefinition
            }
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}