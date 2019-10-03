function Get-PublicIp{
	<#
	.SYNOPSIS
	Get public IPv4 or IPv6 address.
	
	.DESCRIPTION
	API of whatismyipaddress.com used to find public adress.
	
	.PARAMETER IpVersion
	 Choose IpVersion
    .EXAMPLE
    Get-PublicIp-IPversion 4
    Returns current public IPv4-address.
    .EXAMPLE
    Get-PublicIp -IPversion 6
    Returns current public IPv6-address.
    #>

    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $IpVersion
    )

    If($IpVersion -eq "4"){
        $Uri = 'ipv4bot.whatismyipaddress.com'
    }
    elseif ($IpVersion -eq "6") {
        $Uri = 'ipv6bot.whatismyipaddress.com'
    }
    else{
        Write-Host "Error use '4' or '6' as parameters"
    }

    Invoke-WebRequest -Uri $Uri -DisableKeepAlive | Select-Object -ExpandProperty Content
}

function New-GenerateHTML {

    <#
	.SYNOPSIS
	Generate HTML file for PSHTML
	
	.DESCRIPTION
	Generate HTML file for PSHTML
	
	.PARAMETER Path
    Path of Output file
    
    .PARAMETER Variable
    Variable to output on HTML file

    .PARAMETER Open
    Open file in navigator after generation

    .EXAMPLE
    New-GenerateHTML -Path C:\index.html -Variable $Html
    Create html file on output path with variable content.
    #>

    [CmdletBinding()]
    param(
        [Parameter()]
        [string]$Path,
        [string]$Variable,
        [switch]$Open


    )

    $Variable | Out-File -FilePath $Path -Encoding utf8
    if ($Open -eq $true) {
        Start $Path
    }

}

Export-ModuleMember -Function Get-PublicIp , New-GenerateHTML