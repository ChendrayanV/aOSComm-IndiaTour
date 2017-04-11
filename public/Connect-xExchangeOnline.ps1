function Connect-xExchangeOnline {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.Management.Automation.CredentialAttribute()]
        [pscredential]
        $Credential
    )

    process {
        try {
            $ExchangeService = [Microsoft.Exchange.WebServices.Data.ExchangeService]::new()
            $Script:xCredential = [System.Net.NetworkCredential]::new($Credential.UserName , $Credential.Password)
            $ExchangeService.Credentials = $xCredential
            $ExchangeService.Url = "https://outlook.office365.com/EWS/Exchange.asmx"
        }
        catch {
            $_.Exception.Message
        }
    }
}