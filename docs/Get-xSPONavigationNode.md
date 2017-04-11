---
external help file: aOSComm-IndiaTour-help.xml
online version: https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/docs/Get-xSPONavigationNode.md
schema: 2.0.0
---

# Get-xSPONavigationNode

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

```
Get-xSPONavigationNode [-Url] <Object> [-NavigationType] <Object>
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### Example 1
```
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -NavigationType
{{Fill NavigationType Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 
Accepted values: GlobalNavigation, QuickLaunch

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Url
{{Fill Url Description}}

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

## INPUTS

### System.Object

## OUTPUTS

### System.Object

## NOTES
The client laptop we used for testing is not domain joined.
So, for testing purpose $Credential parameter is set  as mandatory.
In next release we will include AAD default authentication.
[@ChendrayanV](https://twitter.com/ChendrayanV)
[Blog Link](http://chen.about-powershell.com)

## RELATED LINKS

