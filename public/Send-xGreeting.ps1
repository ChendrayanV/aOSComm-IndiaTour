function Send-xGreeting {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
    }
    
    process {
        Write-Information -MessageData "Hey, Welcome to India!" -InformationAction Continue
    }
    
    end {
    }
}