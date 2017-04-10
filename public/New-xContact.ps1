function New-xContact {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $Identity,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $GivenName,

        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $MiddleName,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $SurName,

        [Parameter(Mandatory)]
        [ValidateSet('SurName' , 'SurnameCommaGivenName')]
        $FileAsMapping
    )
    
    begin {
    }
    
    process {
        $ExchangeService = [Microsoft.Exchange.WebServices.Data.ExchangeService]::new()
        $ExchangeService.ImpersonatedUserId = [Microsoft.Exchange.WebServices.Data.ImpersonatedUserId]::new([Microsoft.Exchange.WebServices.Data.ConnectingIdType]::SmtpAddress, $Identity)
        $ExchangeService.Credentials = [System.Net.NetworkCredential]::new($xCredential.UserName, $xCredential.Password)
        $ExchangeService.Url = "https://outlook.office365.com/EWS/Exchange.asmx"
        $Contact = [Microsoft.Exchange.WebServices.Data.Contact]::new($ExchangeService)
        $Contact.GivenName = $GivenName
        $Contact.Surname = $SurName
        $Contact.DisplayName = [string]::Concat($GivenName , " " , $SurName)
        $Contact.Save([Microsoft.Exchange.WebServices.Data.WellKnownFolderName]::Contacts)
    }
    
    end {
    }
}
