function Remove-xSPONavigationNode {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Url,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        $Title,

        [Parameter(Mandatory)]
        [ValidateSet('QuickLaunch' , 'GlobalNavigation')]
        $NavigationType
    )
    
    begin {
    }
    
    process {
        try {
            $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new($Url)
            $SPOClientContext.Credentials = $SPOCredential
            switch ($NavigationType) {
                "QuickLaunch" {
                    $QuickLaunchNodes = $SPOClientContext.Web.Navigation.QuickLaunch
                    $SPOClientContext.Load($QuickLaunchNodes)
                    $SPOClientContext.ExecuteQuery()
                    $SPOClientContext.Dispose()
                    for ($i = $QuickLaunchNodes.Count - 1; $i -ge 0; $i--) {
                        if ($QuickLaunchNodes[$i].Title -eq $Title) {
                            $QuickLaunchNodes[$i].DeleteObject()
                        }
                    }
                    $SPOClientContext.ExecuteQuery()
                    $SPOClientContext.Dispose()
                }

                "GlobalNavigation" {
                    $GlobalNavigationNodes = $SPOClientContext.Web.Navigation.TopNavigationBar
                    $SPOClientContext.Load($GlobalNavigationNodes)
                    $SPOClientContext.ExecuteQuery()
                    $SPOClientContext.Dispose()
                    for ($i = $GlobalNavigationNodes.Count - 1; $i -ge 0; $i--) {
                        if ($GlobalNavigationNodes[$i].Title -eq $Title) {
                            $GlobalNavigationNodes[$i].DeleteObject()
                        }
                    }
                    $SPOClientContext.ExecuteQuery()
                    $SPOClientContext.Dispose()
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
