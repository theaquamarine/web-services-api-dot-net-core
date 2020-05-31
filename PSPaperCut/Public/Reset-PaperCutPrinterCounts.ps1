function Reset-PaperCutPrinterCounts {
    <#
        .SYNOPSIS
            Reset the counts (pages and job counts) associated with a printer.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the server hosting the printer.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ServerName,

        #The printer's name.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $PrinterName,

        #The name of the user/script/process resetting the counts.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $ResetBy,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($serverName, 'ResetPrinterCounts')) {
            $PaperCutServer.ResetPrinterCounts($ServerName, $PrinterName, $ResetBy)
        }
    }
}
