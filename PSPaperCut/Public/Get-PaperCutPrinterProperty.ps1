function Get-PaperCutPrinterProperty {
    <#
        .SYNOPSIS
            Gets a printer property.
    #>
    [CmdletBinding()]
    [OutputType("System.String")]
    param (
        #The name of the server.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ServerName,

        #The name of the printer.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $PrinterName,

        #The name of the property.  Valid options include: cost-model, custom-field-1, custom-field-2, custom-field-3, custom-field-4, custom-field-5, custom-field-6, disabled, print-stats.job-count, print-stats.page-count, printer-id
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $PropertyName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetPrinterProperty($ServerName, $PrinterName, $PropertyName)
    }
}
