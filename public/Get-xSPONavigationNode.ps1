function Get-xSPONavigationNode {
    [CmdletBinding()]
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
        $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
        $SPOClientContext.Credentials = $SPOCredential
        switch ($NavigationType) {
            "GlobalNavigation" {
                $GlobalNavigationNodes = $SPOClientContext.Web.Navigation.TopNavigationBar
                $SPOClientContext.Load($GlobalNavigationNodes)
                $SPOClientContext.ExecuteQuery()
                $SPOClientContext.Dispose()
                foreach ($GlobalNavigationNode in $GlobalNavigationNodes) {
                    $GlobalNavigationNode
                }
            }
            "QuickLaunch" {
                $QuickLaunchNodes = $SPOClientContext.Web.Navigation.QuickLaunch
                $SPOClientContext.Load($QuickLaunchNodes)
                $SPOClientContext.ExecuteQuery()
                $SPOClientContext.Dispose()
                foreach ($QuickLaunchNode in $QuickLaunchNodes) {
                    $QuickLaunchNode
                }
            }
        }
    }
    
    end {
    }
}