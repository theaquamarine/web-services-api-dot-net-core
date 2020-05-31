function Update-PaperCutDeviceSettings {
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("System.Boolean")]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $DeviceName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($deviceName, 'ApplyDeviceSettings')) {
            $PaperCutServer.ApplyDeviceSettings($DeviceName)
        }
    }
}
