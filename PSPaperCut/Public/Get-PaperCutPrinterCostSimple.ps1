function Get-PaperCutPrinterCostSimple {
    <#
        .SYNOPSIS
            Get the page cost if, and only if, the printer is using the Simple Charging Model.
    #>
    [CmdletBinding()]
    [OutputType("System.Double")]
    param (
        #The name of the server.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ServerName,

        #The name of the printer.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $PrinterName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetPrinterCostSimple($ServerName, $PrinterName)
    }
}
