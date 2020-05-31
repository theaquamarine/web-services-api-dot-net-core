function Rename-PaperCutPrinter {
    <#
        .SYNOPSIS
            Rename a printer.  This can be useful after migrating a print queue or print server (i.e. the printer retains its history and settings under the new name).  Note that in some cases case sensitivity is important, so care should be taken to enter the name exactly as it appears in the OS.
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The existing printer's server name.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ServerName,

        #The existing printer's queue name.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $PrinterName,

        #The new printer's server name.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $NewServerName,

        #The new printer's queue name.
        [Parameter(Mandatory, Position = 3, ValueFromPipelineByPropertyName)]
        [string] $NewPrinterName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 4, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.RenamePrinter($ServerName, $PrinterName, $NewServerName, $NewPrinterName)
    }
}
