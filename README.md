# aOSComm-IndiaTour
aOS : An independent Community  
[Azure | Office 365 | SharePoint](http://aos.community/index.php/language/en/home/)  
aOS Community recently organized a great community event in India (Mumbai and Bangalore) with the help of Microsoft. 

### aOSMumbai Agenda
![Mumbai](https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/images/Bangalore.png)

### aOSBangalore Agenda
![Bangalore](https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/images/Bangalore.png)

# Automating O365 Using PowerShell
During this event I shared a demo PowerShell module which helps IT Professionals to build 
script module and writing external help in MD using platyPS module. We discussed about best practices while
using script module, Client Side Object Model and EWS Managed API. Yes, we covered few concepts about native SharePoint Online, Exchange Online and MSOnline modules and cmdlets. But, we haven't covered in this repository! 
**At heart, this repo contains about using CSOM, EWS Managed API, platyPS and writing PowerShell script module**

## Discussion Panel
1. Why PowerShell not Python?  
a. There is no thumb rule to use PowerShell if you are familiar in Python do use it. Here is the reference link
[python-sharepoint](https://github.com/ox-it/python-sharepoint). Under the hood it uses REST web services. Be aware of using REST and learn about advantage of using Client Side Object Model.
2. How to convert JSON to and from?    
a. Refer [ConvertFrom-JSON](https://msdn.microsoft.com/powershell/reference/5.1/Microsoft.PowerShell.Utility/ConvertFrom-Json) and [ConvertTo-JSON](https://msdn.microsoft.com/powershell/reference/5.1/Microsoft.PowerShell.Utility/ConvertTo-Json)
3. Why I care about Parameter type?  
a. It's best practise to define the parameter type which helps other IT Professionals or power users
to understand the parameter and it's type. 
4. Which editor is the best for PowerShell?  
a. **With no doubt the answer is VS Code with PowerShell extension**. However, make your choice! If you like 
PowerShell ISE with free or paid add-on's use it. In my case, VS Code it suffice because it supports ll
the extension we need for this module (Example: PS1, MD, XML). VS Code [download]() link and follow [@Code]() in twitter for latest news information. 
5. What is the best way to query large lists?  
a. Use [caml query](https://msdn.microsoft.com/en-us/library/office/ee534956(v=office.14).aspx)
6. What is ExceptionHandlingScope? Why to use in PowerShell?  
a. Exception Handling Scope is one of the advanced task in the Common Programming Tasks in the Managed Client Object Model and this is very important while considering performance. In short, all the three requests like starttry{}, startcatch{} and startfinally{} executes in one call.I would like to thank [DIWUG - Dutch Information Worker User Group](http://www.diwug.nl/Pages/default.aspx) for sharing this great information. 

## Disclaimer
All the PowerShell function created in this module are built on the fly to demo about **Writing PowerShell
Script Module and platyPS for external help**. Please do not use this in production environment without testing. 