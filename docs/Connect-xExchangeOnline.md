---
external help file: aOSComm-IndiaTour-help.xml
online version: https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/docs/Connect-xExchangeOnline.md
schema: 2.0.0
---

# Connect-xExchangeOnline

## SYNOPSIS
A PowerShell function establish a connection with Exchange Online

## SYNTAX

```
Connect-xExchangeOnline [[-Credential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
This PowerShell function is built using EWS Managed API to establish a connection with Exchange Online. 

## EXAMPLES

### Example 1
```
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Credential
Requires impersonation access. Check with Exchange Online admin for more information. 

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[EWS Managed API](http://www.microsoft.com)
