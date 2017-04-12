function Get-xFolder {
    [Outputtype('Microsoft.Exchange.WebServices.Data.ContactsFolder' , 'Microsoft.Exchange.WebServices.Data.CalendarFolder',
        'Microsoft.Exchange.WebServices.Data.Folder')]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $Identity,

        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [int]
        $ItemCount,

        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateSet('Deep' , 'Shallow' , 'SoftDeleted')]
        [string]
        $Traversal
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
                $View = [Microsoft.Exchange.WebServices.Data.FolderView]::new($ItemCount)
            }
            else {
                $View = [Microsoft.Exchange.WebServices.Data.FolderView]::new(10)
            }
            if ($PSBoundParameters.ContainsKey('Traversal')) {
                $View.Traversal = [Microsoft.Exchange.WebServices.Data.FolderTraversal]::$Traversal
            }
            else {
                $View.Traversal = [Microsoft.Exchange.WebServices.Data.FolderTraversal]::Deep
            }
            $Folder = [Microsoft.Exchange.WebServices.Data.Folder]::Bind($ExchangeService, [Microsoft.Exchange.WebServices.Data.WellKnownFolderName]::MsgFolderRoot)
            $Folder.FindFolders($View)
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}