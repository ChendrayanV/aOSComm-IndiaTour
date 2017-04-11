---
external help file: aOSComm-IndiaTour-help.xml
online version: https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/docs/New-xContact.md
schema: 2.0.0
---

# New-xContact

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

```
New-xContact [-Identity] <String> [-GivenName] <String> [[-MiddleName] <String>] [-SurName] <String>
 [-FileAsMapping] <Object> [<CommonParameters>]
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

### -FileAsMapping
{{Fill FileAsMapping Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 
Accepted values: SurName, SurnameCommaGivenName

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GivenName
{{Fill GivenName Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Identity
{{Fill Identity Description}}

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

### -MiddleName
{{Fill MiddleName Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -SurName
{{Fill SurName Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
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

## RELATED LINKS

[EWS Managed API](https://msdn.microsoft.com/en-us/library/office/jj220535(v=exchg.80).aspx)  
[Exchange 2013 101 Code Samples](https://code.msdn.microsoft.com/office/Exchange-2013-101-Code-3c38582c/file/61157/129/Exchange%202013%20101%20Code%20Samples.zip)