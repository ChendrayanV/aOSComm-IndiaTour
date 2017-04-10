function New-xSPOWeb {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Title,

        [Parameter(Mandatory)]
        [ValidateSet('STS#0', 'STS#1')]
        $WebTemplate,

        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateSet('English-US', 'Dutch')]
        $Language
    )
    
    begin {
    }
    
    process {
        $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
        $SPOClientContext.Credentials = $SPOCredential
        $WebCreationInformation = [Microsoft.SharePoint.Client.WebCreationInformation]::new()
        $WebCreationInformation.Title = $Title
        $WebCreationInformation.Url = $Title
        $WebCreationInformation.WebTemplate = $WebTemplate
        switch ($Language) {
            "English" {
                $WebCreationInformation.Language = 1033
            }
            "Dutch" {
                $WebCreationInformation.Language = 1043
            }
        }
        $SubWeb = $SPOClientContext.Web.Webs.Add($WebCreationInformation)
        $SPOClientContext.Load($SubWeb)
        $SPOClientContext.ExecuteQuery()
        $SPOClientContext.Dispose()
    }
    
    end {
    }
}