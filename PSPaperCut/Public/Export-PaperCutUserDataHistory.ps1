function Export-PaperCutUserDataHistory {
    [CmdletBinding()]
    [OutputType("void")]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #Location on the PaperCut MF/NG application server to export CSV reports to. The system account running the PaperCut process must have write permissions to this location.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $SaveLocation,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.ExportUserDataHistory($Username, $SaveLocation)
    }
}
