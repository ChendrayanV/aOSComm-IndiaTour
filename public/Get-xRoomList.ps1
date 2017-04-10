function Get-xRoomList {
    
    begin {
    }
    
    process {
        $ExchangeService = [Microsoft.Exchange.WebServices.Data.ExchangeService]::new()
        $ExchangeService.Credentials = [System.Net.NetworkCredential]::new($xCredential.UserName, $xCredential.Password)
        $ExchangeService.Url = "https://outlook.office365.com/EWS/Exchange.asmx"
        $EmailAddressCollection = $ExchangeService.GetRoomLists()
        foreach ($EmailAddress in $EmailAddressCollection) {
            $EmailAddress
        }
    }
    
    end {
    }
}