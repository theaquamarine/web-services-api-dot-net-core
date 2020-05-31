function Disable-PaperCutPrinter {
    <#
        .SYNOPSIS
            Disable a printer for select period of time.
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The name of the server hosting the printer.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ServerName,

        #The printer's name.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $PrinterName,

        #The number of minutes to disable the printer. If the value is -1 the printer will be disabled for all time until re-enabled.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [int] $DisableMins,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.DisablePrinter($ServerName, $PrinterName, $DisableMins)
    }
}
