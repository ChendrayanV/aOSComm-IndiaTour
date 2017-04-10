function Get-xJunkEmail {
    [CmdletBinding()]
    [Outputtype('Microsoft.Exchange.WebServices.Data.EmailMessage')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Identity,

        [Parameter()]
        $ItemCount
    )
    
    begin {
    }
    
    process {
        try {
            $ExchangeService = [Microsoft.Exchange.WebServices.Data.ExchangeService]::new()
            $ExchangeService.ImpersonatedUserId = [Microsoft.Exchange.WebServices.Data.ImpersonatedUserId]::new([Microsoft.Exchange.WebServices.Data.ConnectingIdType]::SmtpAddress, $Identity)
            $ExchangeService.Credentials = [System.Net.NetworkCredential]::new($xCredential.UserName, $xCredential.Password)
            $ExchangeService.Url = "https://outlook.office365.com/EWS/Exchange.asmx"
            if ($PSBoundParameters.ContainsKey('ItemCount')) {
                $View = [Microsoft.Exchange.WebServices.Data.ItemView]::new($ItemCount)
            }
            else {
                $View = [Microsoft.Exchange.WebServices.Data.ItemView]::new(10)
            }
            $ExchangeService.FindItems([Microsoft.Exchange.WebServices.Data.WellKnownFolderName]::JunkEmail, $View)
        }
        catch {
            $_.Exception.Message 
        }
    }
    
    end {
    }
}