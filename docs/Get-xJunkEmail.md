---
external help file: aOSComm-IndiaTour-help.xml
online version: https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/docs/Get-xJunkEmail.md
schema: 2.0.0
---

# Get-xJunkEmail

## SYNOPSIS
A PowerShell function to retrieve Junk email items from the given mailbox

## SYNTAX

```
Get-xJunkEmail [-Identity] <Object> [[-ItemCount] <Object>] [<CommonParameters>]
```

## DESCRIPTION
This PowerShell function is built using EWS Managed API and requires impersonation permission or mailbox
delegate permission. 

## EXAMPLES

### Example 1
```
PS C:\> Get-xJunkEmail -Identity 'user1@contoso.onmicrosoft.com'
```

Lists first 10 junk email items from the mailbox 'user1@contoso.onmicrosoft.com'

### Example 2
```
PS C:\> 'user1@contoso.onmicrosoft.com' , 'user2@contoso.onmicrosoft.com' | Get-xJunkEmail
```

Lists first 10 junk email items from the mailbox 'user1@contoso.onmicrosoft.com' and 'user2@contoso.onmicrosoft.com'

### Example 3
```
PS C:\> Get-xJunkEmail -Identity 'user1@contoso.onmicrosoft.com' -ItemCount 5
```

Lists first 5 junk email items from the mailbox 'user1@contoso.onmicrosoft.com'

## PARAMETERS

### -Identity
A Valid mailbox ID (SMTP Address)

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ItemCount
Number of junk email items to be retrieved - Default is 10

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Object

## OUTPUTS

### Microsoft.Exchange.WebServices.Data.EmailMessage

## NOTES
The client laptop we used for testing is not domain joined. So, for testing purpose $Credential parameter is set 
as mandatory. In next release we will include AAD default authentication.  
[@ChendrayanV](https://twitter.com/ChendrayanV)  
[Blog Link](http://chen.about-powershell.com)

## RELATED LINKS

[EWS Managed API](https://msdn.microsoft.com/en-us/library/office/dd877012(v=exchg.150).aspx#bk_EWSMA)
[Exchange 2013 101 Code Samples](https://code.msdn.microsoft.com/office/Exchange-2013-101-Code-3c38582c)