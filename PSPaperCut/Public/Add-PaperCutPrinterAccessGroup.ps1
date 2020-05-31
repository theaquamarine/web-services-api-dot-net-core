function Add-PaperCutPrinterAccessGroup {
    <#
        .SYNOPSIS
            Add the group to the printer access group list.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The existing printer's server name.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ServerName,

        #The existing printer's queue name.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $PrinterName,

        #The name of the group that needs to be added to the printer group restrictions list
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $GroupName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($serverName, 'AddPrinterAccessGroup')) {
            $PaperCutServer.AddPrinterAccessGroup($ServerName, $PrinterName, $GroupName)
        }
    }
}