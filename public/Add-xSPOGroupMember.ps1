function Add-xSPOGroupMember {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Identity,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Title
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            $Group = $SPOClientContext.Web.SiteGroups.GetByName($Title)
            $SPOClientContext.Load($Group)
            $xUser = [string]::Concat('i:0#.f|membership|' , $Identity)
            $SPOUser = $SPOClientContext.Web.EnsureUser($xUser)
            $SPOClientContext.Load($SPOUser)
            $addxUser = $Group.Users.Adduser($xUser)
            $SPOClientContext.Load($addxUser)
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