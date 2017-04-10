function Connect-xExchangeOnline {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Management.Automation.CredentialAttribute()]
        [pscredential]
        $Credential
    )

    process {
        try {
            $ExchangeService = [Microsoft.Exchange.WebServices.Data.ExchangeService]::new()
            if ($PSBoundParameters.ContainsKey('Credential')) {
                $Script:xCredential = [System.Net.NetworkCredential]::new($Credential.UserName , $Credential.Password)
                $ExchangeService.Credentials = $xCredential
            }
            else {
                $ExchangeService.UseDefaultCredentials = $true
            }
            $ExchangeService.Url = "https://outlook.office365.com/EWS/Exchange.asmx"
        }
        catch {
            $_.Exception.Message
        }
    }
}