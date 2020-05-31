function Start-PaperCutGroupSync {
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.PerformGroupSync()
    }
}
