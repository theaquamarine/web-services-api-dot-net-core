function Get-PaperCutTaskStatus {
    [CmdletBinding()]
    [OutputType("PaperCut.GetTaskStatusResponse")]
    param (
        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetTaskStatus()
    }
}
