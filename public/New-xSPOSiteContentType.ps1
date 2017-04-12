function New-xSPOSiteContentType {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [uri]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $Name,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $Group,

        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $Description
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            $ContentTypeCollection = $SPOClientContext.Web.ContentTypes
            $ContentTypeCreation = [Microsoft.SharePoint.Client.ContentTypeCreationInformation]::new()
            $ContentTypeCreation.Name = $Name
            if($PSBoundParameters.ContainsKey('Description')) {
                $ContentTypeCreation.Description = $Description
            }
            else {
                $ContentTypeCreation.Description = "No description"
            }
            $ContentTypeCreation.Group = $Group
            $NewContentType = $ContentTypeCollection.Add($ContentTypeCreation)
            $SPOClientContext.Load($NewContentType)
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

Import-Module .\assemblies\Microsoft.SharePoint.Client.dll