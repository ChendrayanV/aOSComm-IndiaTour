---
external help file: aOSComm-IndiaTour-help.xml
online version: https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/docs/Connect-xSharePointOnline.md
schema: 2.0.0
---

# Connect-xSharePointOnline

## SYNOPSIS
A PowerShell function to establish a connection with SharePoint Online tenant.

## SYNTAX

```
Connect-xSharePointOnline [-Url] <Uri> [-Credential] <PSCredential> [<CommonParameters>]
```

## DESCRIPTION
This PowerShell function is built using Client Side Object Model (CSOM). For a demo purpose
we are connecting with SharePoint Online tenant as a tenant admin. So, we can access all other 
site collections and sites. 

## EXAMPLES

### Example 1
```
PS C:\> Connect-xSharePointOnline -Url 'https://contoso-admin.sharepoint.com' -Credential 'admin@contoso.onmicrosoft.com'
```

This cmdlet will allow you to establish a connection with SharePoint Online as tenant admin. 

## PARAMETERS

### -Credential
SharePoint Online Tenant administrator credential.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Url
SharePoint Online Tenant admin url (Example: https://tenant-admin.sharepoint.com)

```yaml
Type: Uri
Parameter Sets: (All)
Aliases: 

Required: True
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
The client laptop we used for testing is not domain joined. So, for testing purpose $Credential parameter is set 
as mandatory. In next release we will include AAD default authentication.  
[@ChendrayanV](https://twitter.com/ChendrayanV)  
[Blog Link](http://chen.about-powershell.com)

## RELATED LINKS

[SharePoint 2013 .Net Client Side Object Model Cookbook](http://www.c-sharpcorner.com/ebooks/sharepoint-2013-dot-net-client-side-object-model-cookbook)
