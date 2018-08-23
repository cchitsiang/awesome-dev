[CmdletBinding()]
Param(
    [string] $WebApplicationUrl = "http://$env:computername.$env:userdnsdomain",
    [bool] $AllSiteCollection = $True
)

function Load-SPSnapin
{

	$snapin = (Get-PSSnapin -name Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue)

	if ($snapin -ne $null) {
		Write-Host "Info: SharePoint Snap-in is loaded. Action: No action required."
	}
	else
	{
		try
		{
			Write-Host "Info: SharePoint Snap-in not found. Action: Loading SharePoint Snap-in."
			Add-PSSnapin Microsoft.SharePoint.PowerShell -ErrorAction Stop
		}
		catch
		{
			$errText = $error[0].Exception.Message
			Write-Host "Loading of SharePoint Snap-in failed. Reason: $errText" -ForegroundColor Red
            exit;
		}
	}
}

function Activate-Feature($url, $featureName, $scope)
{
    $feature=$null

    switch($Scope)
    {
        "Farm" { $feature = Get-SPFeature -Farm -ErrorAction SilentlyContinue | Where-object {$_.DisplayName -eq $featureName } }
        "WebApplication" { $feature = Get-SPFeature -WebApplication $url -ErrorAction SilentlyContinue | Where-object {$_.DisplayName -eq $featureName } }
        "Site" { $feature = Get-SPFeature -Site $url -ErrorAction SilentlyContinue | Where-object {$_.DisplayName -eq $featureName } }
        "Web" { $feature = Get-SPFeature -Web $url -ErrorAction SilentlyContinue | Where-object {$_.DisplayName -eq $featureName } }
    }

    if($feature)
    {
       Write-Host $featureName already activated at $url, will be skipped... -ForegroundColor Blue
	   return
    }


    Enable-SPFeature –identity $featureName -URL $url -ErrorAction SilentlyContinue -ErrorVariable Error

    if($Error)
    {
        if(-not $Error[0].Exception.Message.Contains("not found"))
        {
            $Error[0].Exception
        }
    }
    else
    {
        Write-Host "Activated SharePoint Feature $featureName at $url..."
    }
}

Load-SPSnapin

$SiteCollectionfeatures = ("NintexWorkflow", "NintexWorkflowInfoPath", "NintexWorkflowEnterpriseWebParts", "NintexWorkflowWebParts", "NintexWorkflowLiveSite")
$SiteFeatures = ("NintexWorkflowWeb", "NintexWorkflowEnterpriseWeb" )

if($AllSiteCollection)
{
    Write-Host "Active Nintex Workflow ALL site collection and site features for Web Application: $WebApplicationUrl"
}
else
{
    Write-Host "Active Nintex Workflow ROOT site collection and site features for Web Application: $WebApplicationUrl"
}

if($AllSiteCollection)
{
    $webApp = Get-SPWebApplication $WebApplicationUrl
    $siteCollections = $webApp.Sites
}
else
{
    $siteCollections = @( Get-SPSite $WebApplicationUrl )
}

foreach($siteCollection in $siteCollections)
{
    foreach($siteCollectionFeature in $SiteCollectionfeatures)
    {
        Activate-Feature -url $siteCollection.Url -featureName $siteCollectionFeature -scope "Site"
    }

    foreach($siteFeature in $SiteFeatures)
    {
        Activate-Feature -url $siteCollection.Url -featureName $siteFeature -scope "Web"
    }
}

