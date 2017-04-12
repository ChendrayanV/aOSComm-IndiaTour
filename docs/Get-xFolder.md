---
external help file: aOSComm-IndiaTour-help.xml
online version: https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/docs/Get-xFolder.md
schema: 2.0.0
---

# Get-xFolder

## SYNOPSIS
A PowerShell function to retrieve folder information from the given mailbox

## SYNTAX

```
Get-xFolder [-Identity] <String> [[-ItemCount] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This function is built using EWS Managed API and need mailbox delegate or impersonation permission. 

## EXAMPLES

### Example 1
```
PS C:\> Get-xFolder -Identity 'user1@contoso.onmicrosoft.com'
```

Lists first 10 folder information for the mailbox 'user1@contoso.onmicrosoft.com'

### Example 2
```
PS C:\> 'user1@contoso.onmicrosoft.com' , 'user2@contoso.onmicrosoft.com' | Get-xFolder 
```

Lists first 10 folder information for the mailbox user1 and user2

### Example 3
```
PS C:\> Get-xFolder -Identity 'user1@contoso.onmicrosoft.com' -ItemCount 30
```

Lists first 30 folder information for the mailbox user1 and user2

## PARAMETERS

### -Identity
A valid mailbox SMTP address

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ItemCount
Number of folders to be retrieved

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String
System.Int32

## OUTPUTS

### Microsoft.Exchange.WebServices.Data.ContactsFolder
Microsoft.Exchange.WebServices.Data.CalendarFolder
Microsoft.Exchange.WebServices.Data.Folder

## NOTES
The client laptop we used for testing is not domain joined. So, for testing purpose $Credential parameter is set 
as mandatory. In next release we will include AAD default authentication.  
[@ChendrayanV](https://twitter.com/ChendrayanV)  
[Blog Link](http://chen.about-powershell.com)

## RELATED LINKS

[EWS Managed API](https://msdn.microsoft.com/en-us/library/office/dd877012(v=exchg.150).aspx#bk_EWSMA)
[Exchange 2013 101 Code Samples](https://code.msdn.microsoft.com/office/Exchange-2013-101-Code-3c38582c)