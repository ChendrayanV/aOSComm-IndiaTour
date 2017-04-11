---
external help file: aOSComm-IndiaTour-help.xml
online version: https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/docs/Connect-xExchangeOnline.md
schema: 2.0.0
---

# Connect-xExchangeOnline

## SYNOPSIS
A PowerShell function to establish a connection with Exchange Online. 

## SYNTAX

```
Connect-xExchangeOnline [-Credential] <PSCredential> [<CommonParameters>]
```

## DESCRIPTION
This function is built using EWS Managed API and requires impersonation or minimum delegated permission. Contact Exchange Online administrator for more information.  

## EXAMPLES

### Example 1
```
PS C:\> Connect-xExchangeOnline -Credential 'admin@contoso.onmicrosoft.com'
```

This cmdlet is to connect with Exchange Online as administrator. Once the connection is established 
successfully other Exchange Online functions in this module re-use the same. 

### Example 2
```
PS C:\> $Credential = Get-Credential -Credential 'admin@contoso.onmicrosoft.com'
PS C:\> Connect-xExchangeOnline -Credential $Credential
```

An alternate approach of Example 1 - Here the variable $Credential can be reused. 

## PARAMETERS

### -Credential
Exchange Online admin or any account with impersonation or delegate access permission on the mailbox. 

```yaml
Type: PSCredential
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
[Exchange 2013 101 Code Samples](https://code.msdn.microsoft.com/office/Exchange-2013-101-Code-3c38582c)
