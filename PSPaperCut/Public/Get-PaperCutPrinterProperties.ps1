function Get-PaperCutPrinterProperties {
    <#
        .SYNOPSIS
            Gets a list printer properties.
    #>
    [CmdletBinding()]
    [OutputType("System.String[]")]
    param (
        #The name of the server.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ServerName,

        #The name of the printer.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $PrinterName,

        #An array of strings, one for each property name
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string[]] $PropertyNames,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetPrinterProperties($ServerName, $PrinterName, $PropertyNames)
    }
}
