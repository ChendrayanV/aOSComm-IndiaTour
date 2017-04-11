# aOSComm-IndiaTour
aOS : An independent Community  
[Azure | Office 365 | SharePoint](http://aos.community/index.php/language/en/home/)  
aOS Community recently organized a great community event in India (Mumbai and Bangalore) with the help of Microsoft. To know more about the event search in twitter [#aOSIndiaTour](https://twitter.com/hashtag/aOSIndiaTour?src=hash) , [#aOSBangalore](https://twitter.com/hashtag/aOSBangalore?src=hash) , [#aOSMumbai](https://twitter.com/hashtag/aOSMumbai?src=hash). Follow [@aOSComm](https://twitter.com/aOSComm) for latest news and events across the globe.  

[Refer this link](https://www.eventbrite.fr/o/aos-community-12270024117) for upcoming aOS Community events in and around your city. 

### aOSMumbai Agenda
![Mumbai](https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/images/Mumbai.jpg)

### aOSBangalore Agenda
![Bangalore](https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/images/Bangalore.png)

### Speakers Twitter ID (**Contact for more information about the content**)
Name | Twitter ID | Location | Slide Deck (Docs.com)
---- | ---------- | -------- | ---------------------
Ashish Trivedi | [@_AshishTrivedi](https://twitter.com/_AshishTrivedi) | Bangalore and Mumbai | [YTD]
Chendrayan Venkatesan | [@ChendrayanV](https://twitter.com/ChendrayanV) | Bangalore and Mumbai | [YTD]
Christian Ståhl | [@CStahl](https://twitter.com/CStahl) | Bangalore and Mumbai | [Getting Started with Add-in Development for SharePoint Online and Office365](https://docs.com/aos-community/9526/getting-started-with-add-in-development-for)
Dipti Chhatrapati | [@dips84](https://twitter.com/dips84) | Bangalore and Mumbai | [YTD]
Feroz Khan | [@TechFero](https://twitter.com/) | Bangalore | [YTD]
Jasjit Chopra | [@JasjitChopra](https://twitter.com/jasjitchopra) | Mumbai | [YTD]
Narasima Perumal | [@narasimaperumal](https://twitter.com/narasimaperumal) | Bangalore | [YTD]
Patrick Guimonet | [@patricg](https://twitter.com/patricg) | Bangalore and Mumbai | [YTD]
Prabhjot Singh Bakshi | [@prabhjotbakshi](https://twitter.com/prabhjotbakshi) | Mumbai | [YTD]
Rhomil Bheda | [@Romil_Bheda](https://twitter.com/Romil_Bheda) | Mumbai | [YTD]
Sébastien Paulet | [@SP_twit](https://twitter.com/SP_twit) | Bangalore and Mumbai | [YTD]

# Automating O365 Using PowerShell
During this event I shared a demo PowerShell module which helps IT Professionals to build 
script module and writing external help in MD using platyPS module. We discussed about best practices in 
script module, Client Side Object Model and EWS Managed API. Yes, we covered few concepts about native SharePoint Online, Exchange Online and MSOnline modules and cmdlets. But, we haven't covered in this repository! 
**At heart, this repo contains about using CSOM, EWS Managed API, platyPS and writing PowerShell script module**

## General Discussion Panel
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
7. What is outputtype? Why to use?  
a. Use [help about_Functions_OutputTypeAttribute](https://msdn.microsoft.com/en-us/powershell/reference/5.1/microsoft.powershell.core/about/about_functions_outputtypeattribute)  
b. A simple one line declaration helps us to select the properties by tab completion. 
8. Where can we get platyPS Module?  
a. Install-Module platyPS -Verbose (Works in PowerShell 5.0 +)  
b. [GitHub Link](https://github.com/PowerShell/platyPS)  
c. [PowerShell Gallery](https://www.powershellgallery.com/packages/platyPS/0.7.6)  
d. Refer [Writing Help for Windows PowerShell Modules](https://msdn.microsoft.com/en-us/library/dd878343(v=vs.85).aspx)  
9. Where can we get more videos about CSOM?  
a. With no doubt [Channel 9](https://channel9.msdn.com/search?term=sharepoint%20client%20side%20object%20model#ch9Search&lang-en=en&pubDate=year)

## Sincere Thanks
[Vijai Anand Ramalingam](http://www.c-sharpcorner.com/members/vijai-anand-ramalingam) for the excellent SharePoint 2013 .Net Client Side Object Model Cookbook.  
[François-Xavier Cat](https://github.com/lazywinadmin) for expanding help in MD and github.  
[aOSComm](https://twitter.com/aOSComm) for giving me an oppurtunity to share ideas about CSOM, EWS Managed API and PowerShell 
## Disclaimer
All the PowerShell function created by me (Chendrayan Venkatesan a.k.a Chen V) in this module are built on the fly to demo about **Writing PowerShell
Script Module and platyPS for external help**. Please do not use this in production environment without testing. Kindly read the [MIT License](https://github.com/ChendrayanV/aOSComm-IndiaTour/blob/master/LICENSE)