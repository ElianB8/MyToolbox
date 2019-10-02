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

Export-ModuleMember -Function Get-PublicIp