function Get-xSPOUserProfile {
    [CmdletBinding()]
    [Outputtype('System.Management.Automation.PSCustomObject')]
    param (
        [Parameter(Mandatory)]
        $Url
    )
    
    begin {
    }
    
    process {
        $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
        $SPOClientContext.Credentials = $SPOCredential
        $SPOUsers = $SPOClientContext.Web.SiteUsers
        $SPOClientContext.Load($SPOUsers)
        $SPOClientContext.ExecuteQuery()

        $PeopleManager = [Microsoft.SharePoint.Client.UserProfiles.PeopleManager]::new($SPOClientContext)
        $Collection = @()
        foreach ($User in $SPOUsers) {
            $UserProfile = $PeopleManager.GetPropertiesFor($User.LoginName)
            $SPOClientContext.Load($UserProfile)
            $SPOClientContext.ExecuteQuery()
            if ($UserProfile.Email -ne $null) {
                $Upp = $UserProfile.UserProfileProperties 
                $SPOUser = New-Object PSObject -Property $Upp
                $Collection += $SPOUser 
            }
        }
        $Collection
    }
    
    end {
    }
}