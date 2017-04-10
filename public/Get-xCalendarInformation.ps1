function Get-xCalendarInformation {
    [CmdletBinding()]
    [Outputtype('Microsoft.Exchange.WebServices.Data.Appointment')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $Identity,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [int]
        $Days
    )
    
    begin {
    }
    
    process {
        try {
            $ExchangeService = [Microsoft.Exchange.WebServices.Data.ExchangeService]::new()
            $ExchangeService.ImpersonatedUserId = [Microsoft.Exchange.WebServices.Data.ImpersonatedUserId]::new([Microsoft.Exchange.WebServices.Data.ConnectingIdType]::SmtpAddress, $Identity)
            $ExchangeService.Credentials = [System.Net.NetworkCredential]::new($xCredential.UserName, $xCredential.Password)
            $ExchangeService.Url = "https://outlook.office365.com/EWS/Exchange.asmx"
            $CalendarFolder = [Microsoft.Exchange.WebServices.Data.CalendarFolder]::Bind($ExchangeService, [Microsoft.Exchange.WebServices.Data.WellKnownFolderName]::Calendar)
            $View = [Microsoft.Exchange.WebServices.Data.CalendarView]::new([datetime]::Now, [datetime]::Now.AddDays($Days))
            $AppointmentCollection = $CalendarFolder.FindAppointments($View)
            foreach ($Appointment in $AppointmentCollection) {
                $Appointment
            }
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}