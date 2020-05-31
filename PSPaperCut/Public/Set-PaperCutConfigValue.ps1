function Set-PaperCutConfigValue {
    <#
        .SYNOPSIS
            Set the config value from the server. NOTE: Take care updating config values.  You may cause serious problems which can only be fixed by reinstallation of the application. Use the setConfigValue API at your own risk.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the config value to set.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ConfigName,

        #The value to set.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $ConfigValue,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($configName, 'SetConfigValue')) {
            $PaperCutServer.SetConfigValue($ConfigName, $ConfigValue)
        }
    }
}
