---
external help file: aOSComm-IndiaTour-help.xml
online version: https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/docs/Expand-xDistributionGroup.md
schema: 2.0.0
---

# Expand-xDistributionGroup

## SYNOPSIS
A PowerShell function to expand the given distribution group. 

## SYNTAX

```
Expand-xDistributionGroup [-Identity] <String> [<CommonParameters>]
```

## DESCRIPTION
This function is built using EWS Managed API. 

## EXAMPLES

### Example 1
```
PS C:\> Expand-xDistributionGroup -Identity 'group1@contoso.onmicrosoft.com'
```

Expands the given group group1@contoso.onmicrosoft.com

### Example 2
```
PS C:\> 'group1@contoso.onmicrosoft.com', 'group2@contoso.onmicrosoft.com' | Expand-xDistributionGroup
```

Expands the given groups group1@contoso.onmicrosoft.com and group2@contoso.onmicrosoft.com

## PARAMETERS

### -Identity
Distribution group ID (admingroup@contoso.onmicrosoft.com)

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

### Microsoft.Exchange.WebServices.Data.EmailAddress

## NOTES
The client laptop we used for testing is not domain joined. So, for testing purpose $Credential parameter is set 
as mandatory. In next release we will include AAD default authentication.  
[@ChendrayanV](https://twitter.com/ChendrayanV)  
[Blog Link](http://chen.about-powershell.com)

## RELATED LINKS

[EWS Managed API](https://msdn.microsoft.com/en-us/library/office/dd877012(v=exchg.150).aspx#bk_EWSMA)
[Exchange 2013 101 Code Samples](https://code.msdn.microsoft.com/office/Exchange-2013-101-Code-3c38582c)