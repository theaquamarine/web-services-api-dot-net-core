function Set-PaperCutPrinterProperties {
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ServerName,

        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $PrinterName,

        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string[,]] $PropertyNamesAndValues,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($serverName, 'SetPrinterProperties')) {
            $PaperCutServer.SetPrinterProperties($ServerName, $PrinterName, $PropertyNamesAndValues)
        }
    }
}
