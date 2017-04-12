---
external help file: aOSComm-IndiaTour-help.xml
online version: https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/docs/Get-xInboxRule.md
schema: 2.0.0
---

# Get-xInboxRule

## SYNOPSIS
A PowerShell function to retreive Inbox rule information.

## SYNTAX

```
Get-xInboxRule [-Identity] <String> [<CommonParameters>]
```

## DESCRIPTION
This PowerShell function is built using EWS Managed API and requires mailbox delegate permission or impersonation permission. 

## EXAMPLES

### Example 1
```
PS C:\> Get-xInboxRule -Identity 'user1@constoso.com'
```

A PowerShell function to retrieve inbox rule for the given mailbox

### Example 2
```
PS C:\> 'user1@constoso.com' , 'user2@constoso.com' | Get-xInboxRule
```

A PowerShell function to retrieve inbox rule for the given mailboxes

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### System.Object

## NOTES
The client laptop we used for testing is not domain joined. So, for testing purpose $Credential parameter is set 
as mandatory. In next release we will include AAD default authentication.  
[@ChendrayanV](https://twitter.com/ChendrayanV)  
[Blog Link](http://chen.about-powershell.com)

## RELATED LINKS

[EWS Managed API](https://msdn.microsoft.com/en-us/library/office/dd877012(v=exchg.150).aspx#bk_EWSMA)
[Exchange 2013 101 Code Samples](https://code.msdn.microsoft.com/office/Exchange-2013-101-Code-3c38582c)