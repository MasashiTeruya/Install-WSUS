
<#
.Synopsis
   Install WSUS role on specified computer.
.DESCRIPTION
   Install WSUS role on specified computer.
   TODO: What we need is details.
.EXAMPLE
   Install-WSUS MyHost
#>

function Install-WSUS
{
    [CmdletBinding()]
    Param
    (
        # Hostname of computers to install services
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   ValueFromPipeline=$true,
                   Position=0)]
        [string[]]
        $ComputerName,
        
        # Path to save contents sent from Windows Update services
        [string]
        $ContentPath = "C:\WSUS"
    )

    Begin
    {
    }
    Process
    {
        foreach($cname in $ComputerName){

            Write-Verbose "Configure Role on $cname"
            $result = Install-WindowsFeature -Name UpdateServices -ComputerName $cname

            Write-Verbose "Execute postinstall command"
            Invoke-Command -ComputerName $cname -ArgumentList $ContentPath -ScriptBlock{
                $ContentPath = $args[0]
                Write-Host $ContentPath
                & 'C:\Program Files\Update Services\Tools\WsusUtil.exe' postinstall CONTENT_DIR=$ContentPath

            }
            
        }
    }
    End
    {
    }
}
