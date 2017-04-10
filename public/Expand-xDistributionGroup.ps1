function Expand-xDistributionGroup {
    [CmdletBinding()]
    [Outputtype('Microsoft.Exchange.WebServices.Data.EmailAddress')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $Identity
    )
    
    begin {
    }
    
    process {
        try {
            $ExchangeService = [Microsoft.Exchange.WebServices.Data.ExchangeService]::new()
            $ExchangeService.Credentials = $xCredential
            $ExchangeService.Url = "https://outlook.office365.com/EWS/Exchange.asmx"
            $ExchangeService.ExpandGroup($Identity)
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}