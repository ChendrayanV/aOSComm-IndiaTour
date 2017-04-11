function Get-xSPONavigationNode {
    [CmdletBinding()]
    [outputtype('Microsoft.SharePoint.Client.NavigationNode')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Url,

        [Parameter(Mandatory)]
        [ValidateSet('GlobalNavigation' , 'QuickLaunch')]
        $NavigationType
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            switch ($NavigationType) {
                "GlobalNavigation" {
                    $GlobalNavigationNodes = $SPOClientContext.Web.Navigation.TopNavigationBar
                    $SPOClientContext.Load($GlobalNavigationNodes)
                    $SPOClientContext.ExecuteQuery()
                    $SPOClientContext.Dispose()
                    foreach ($GlobalNavigationNode in $GlobalNavigationNodes) {
                        $GlobalNavigationNode | Select-Object -Property ([Microsoft.SharePoint.Client.NavigationNode].GetProperties().Where( {$_.Propertytype -notlike "*Collection*"})).Name
                    }
                }
                "QuickLaunch" {
                    $QuickLaunchNodes = $SPOClientContext.Web.Navigation.QuickLaunch
                    $SPOClientContext.Load($QuickLaunchNodes)
                    $SPOClientContext.ExecuteQuery()
                    $SPOClientContext.Dispose()
                    foreach ($QuickLaunchNode in $QuickLaunchNodes) {
                        $QuickLaunchNode | Select-Object -Property ([Microsoft.SharePoint.Client.NavigationNode].GetProperties().Where( {$_.Propertytype -notlike "*Collection*"})).Name
                    }
                }
            }
        }
        catch {
            $_.Exception.Message
        }
    }
    
    end {
    }
}