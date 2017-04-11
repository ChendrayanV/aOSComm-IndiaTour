---
external help file: aOSComm-IndiaTour-help.xml
online version: https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/docs/Enable-xSPOFolderCreation.md
schema: 2.0.0
---

# Enable-xSPOFolderCreation

## SYNOPSIS
A PowerShell function to enable folder creation in the given SharePoint list

## SYNTAX

```
Enable-xSPOFolderCreation [-Url] <Object> [-Title] <Object> [<CommonParameters>]
```

## DESCRIPTION
This PowerShell function is built using CSOM Managed API

## EXAMPLES

### Example 1
```
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Title
{{Fill Title Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### Void

## NOTES
Connect-xSharePointOnline function needs to be executed prior using this function.  
[@ChendrayanV](https://twitter.com/chendrayanv)  
[Blog](http://chen.about-powershell.com)

## RELATED LINKS

[SharePoint 2013 .Net Client Side Object Model Cookbook](http://www.c-sharpcorner.com/ebooks/sharepoint-2013-dot-net-client-side-object-model-cookbook)