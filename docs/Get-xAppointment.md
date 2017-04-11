---
external help file: aOSComm-IndiaTour-help.xml
online version: https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/docs/Add-xSPOListItem.md
schema: 2.0.0
---

# Get-xAppointment

## SYNOPSIS
A PowerShell function to retrieve appointment information from the given mailbox

## SYNTAX

```
Get-xAppointment [-Identity] <String> [-Days] <Int32>
```

## DESCRIPTION
This PowerShell function is created using EWS Managed API and requires mailbox delegate or impersonation permission. 
Contact Exchange Online admin for more information. 

## EXAMPLES

### Example 1
```
PS C:\> Get-xAppointment -Identity 'user1@contoso.onmicrosoft.com' -Days 2
```

Retrieves next 2 days appointment information from the given mailbox.

### Example 2
```
PS C:\> 'user1@contoso.onmicrosoft.com' , 'user2@contoso.onmicrosoft.com' | Get-xAppointment -Days 2
```

Retrieves next 2 days appointment information from the given mailboxes.

## PARAMETERS

### -Days
Number of days (from now and next x days)

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Identity
Valis Mailbox SMTP address

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

## INPUTS

### System.String
System.Int32


## OUTPUTS

### Microsoft.Exchange.WebServices.Data.Appointment


## NOTES

## RELATED LINKS

