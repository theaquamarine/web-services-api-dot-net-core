function Get-PaperCutTotalUsers {
    [CmdletBinding()]
    [OutputType("System.Int32")]
    param (
        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetTotalUsers()
    }
}
