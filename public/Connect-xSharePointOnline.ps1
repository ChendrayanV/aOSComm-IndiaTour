function Connect-xSharePointOnline {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position = 0)]
        [uri]
        $Url,

        [Parameter(Mandatory, Position = 1)]
        [System.Management.Automation.CredentialAttribute()]
        [pscredential]
        $Credential
    )
    
    begin {
    }
    
    process {
        $Script:SPOCredential = [Microsoft.SharePoint.Client.SharePointOnlineCredentials]::new($Credential.UserName , $Credential.Password)            
        $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)            
        $SPOClientContext.Credentials = $SPOCredential            
        $oTenant = [Microsoft.Online.SharePoint.TenantAdministration.Tenant]::new($SPOClientContext)            
        $oTenant.ServerObjectIsNull.Value -ne $true | Out-Null            
        try {            
            $SPOClientContext.ExecuteQuery()            
        }            
        Catch {            
            $_.Exception.Message             
        }            
    }
    
    end {
    }
}