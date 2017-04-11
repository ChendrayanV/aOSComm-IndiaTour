---
external help file: aOSComm-IndiaTour-help.xml
online version: https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/docs/Search-xSPOSite.md
schema: 2.0.0
---

# Search-xSPOSite

## SYNOPSIS
A PowerShell function to search SharePoint Online retrieve results. 

## SYNTAX

```
Search-xSPOSite [-Url] <Uri> [-QueryText] <String>
```

## DESCRIPTION
This PowerShell is built using CSOM for demo in @aOSComm event in #aOSMumbai and #aOSBangalore for more information refer README.MD

## EXAMPLES

### Example 1
```
PS C:\> Search-xSPOSite -Url https://chensoffice365.sharepoint.com -QueryText 'SearchString'
```

Retrieve SharePoint search results for the keyword SearchString (Replace it with your own word e.g: PowerShell)

### Example 2
```
PS C:\> '*.docx' ,'*.xlsx' , '*aOS*' | Search-xSPOSite -Url https://chensoffice365.sharepoint.com
```

Retrieve SharePoint search results for the keywords before the pipeline 

## PARAMETERS

### -QueryText
Any keyword (PowerShell, *.docx , *.pptx)

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

### -Url
Site or Site Collection Url

```yaml
Type: Uri
Parameter Sets: (All)
Aliases: 

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

## INPUTS

### System.Uri
### System.String


## OUTPUTS

### System.Object

## NOTES
The client laptop we used for testing is not domain joined. So, for testing purpose $Credential parameter is set 
as mandatory. In next release we will include AAD default authentication.  
[@ChendrayanV](https://twitter.com/ChendrayanV)  
[Blog Link](http://chen.about-powershell.com)

## RELATED LINKS

