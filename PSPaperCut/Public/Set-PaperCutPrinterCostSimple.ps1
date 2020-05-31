function Set-PaperCutPrinterCostSimple {
    <#
        .SYNOPSIS
            Method to set a simple single page cost using the Simple Charging Model.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the server.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ServerName,

        #The name of the printer.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $PrinterName,

        #The cost per page (simple charging model)
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [double] $CostPerPage,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($serverName, 'SetPrinterCostSimple')) {
            $PaperCutServer.SetPrinterCostSimple($ServerName, $PrinterName, $CostPerPage)
        }
    }
}
