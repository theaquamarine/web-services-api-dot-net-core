function Set-PaperCutPrinterProperty {
    <#
        .SYNOPSIS
            Sets a printer property.
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

        #The name of the property.  Valid options include: disabled.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $PropertyName,

        #The value of the property to set.
        [Parameter(Mandatory, Position = 3, ValueFromPipelineByPropertyName)]
        [string] $PropertyValue,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 4, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($serverName, 'SetPrinterProperty')) {
            $PaperCutServer.SetPrinterProperty($ServerName, $PrinterName, $PropertyName, $PropertyValue)
        }
    }
}
