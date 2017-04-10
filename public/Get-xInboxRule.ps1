function Get-xInboxRule {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $Identity
    )
    
    begin {
    }
    
    process {
        $ExchangeService = [Microsoft.Exchange.WebServices.Data.ExchangeService]::new()
        $ExchangeService.Credentials = $xCredential
        $ExchangeService.ImpersonatedUserId = [Microsoft.Exchange.WebServices.Data.ImpersonatedUserId]::new([Microsoft.Exchange.WebServices.Data.ConnectingIdType]::SmtpAddress, $Identity)
        $ExchangeService.Url = "https://outlook.office365.com/EWS/Exchange.asmx"
        $ExchangeService.GetInboxRules()
    }
    
    end {
    }
}