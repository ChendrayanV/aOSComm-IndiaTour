function Get-xMailBox {
    [CmdletBinding()]
    [Outputtype('Microsoft.Exchange.WebServices.Data.SearchableMailbox')]
    param (
        [Parameter(Mandatory)]
        [bool]
        $ExpandGroupMemberShip
    )
    
    begin {
    }
    
    process {
        $ExchangeService = [Microsoft.Exchange.WebServices.Data.ExchangeService]::new()
        $ExchangeService.Credentials = $xCredential
        $ExchangeService.Url = "https://outlook.office365.com/EWS/Exchange.asmx"
        $ExchangeService.GetSearchableMailboxes([string]::Empty, $ExpandGroupMemberShip).SearchableMailboxes
    }
    
    end {
    }
}