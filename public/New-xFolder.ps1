function New-xFolder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,ValueFromPipeline,ValueFromPipelineByPropertyName)]
        $Identity,

        [Parameter(Mandatory,ValueFromPipeline,ValueFromPipelineByPropertyName)]
        $Title,

        [Parameter(ValueFromPipeline,ValueFromPipelineByPropertyName)]
        [ValidateSet('Inbox' , 'Calendar')]
        $Location
    )
    
    begin {
    }
    
    process {
        try {
            $ExchangeService = [Microsoft.Exchange.WebServices.Data.ExchangeService]::new()
            $ExchangeService.ImpersonatedUserId = [Microsoft.Exchange.WebServices.Data.ImpersonatedUserId]::new([Microsoft.Exchange.WebServices.Data.ConnectingIdType]::SmtpAddress, $Identity)
            $ExchangeService.Credentials = [System.Net.NetworkCredential]::new($xCredential.UserName, $xCredential.Password)
            $ExchangeService.Url = "https://outlook.office365.com/EWS/Exchange.asmx"
            $Folder = [Microsoft.Exchange.WebServices.Data.folder]::new($Folder)
            $Folder.DisplayName = $Title
            $Folder.Save($Location)
        }
        catch {
            Write-Error -Message "$_" -InformationAction Continue
        }
    }
    
    end {
    }
}