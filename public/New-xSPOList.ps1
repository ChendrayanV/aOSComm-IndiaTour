function New-xSPOList {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        # SharePoint Url (Site or Web).
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        # Name of the List needs to created.
        $Title,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [Microsoft.SharePoint.Client.ListTemplateType]
        # Enum type allows tab completion to choose the required type. 
        $TemplateType,

        [Parameter(ValueFromPipeline)]
        # Sets the Description of the List or Document Library
        $Description,

        [Parameter(ValueFromPipeline)]
        # Sets hidden property of the List or Document Library 
        [bool]
        $Hidden
    )

    
    begin {
    }
    
    process {
        $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url);
        $SPOClientContext.Credentials = $SPOCredential
        $Scope = [Microsoft.SharePoint.Client.ExceptionHandlingScope]::new($SPOClientContext)
        $Start = $Scope.StartScope()
        #Try Block
        $xTry = $Scope.StartTry()
        $List = $SPOClientContext.Web.Lists.GetByTitle($Title);
        $List.Update()
        $xTry.Dispose()
        #Catch Block
        $xCatch = $Scope.StartCatch()
        $NewList = [Microsoft.SharePoint.Client.ListCreationInformation]::new()
        $NewList.Title = $Title
        $NewList.TemplateType = [int]$TemplateType
        $NewList.Description = $Description
        $List = $SPOClientContext.Web.Lists.Add($NewList)
        $List.Hidden = $Hidden
        $xCatch.Dispose()
        #Finaly Block
        $xFinally = $Scope.StartFinally()
        $List = $SPOClientContext.Web.Lists.GetByTitle($Title);
        $List.Update()
        $xFinally.Dispose()
        $Start.Dispose()
        $SPOClientContext.ExecuteQuery()
        $SPOClientContext.Dispose()
    }
    
    end {
    }
}