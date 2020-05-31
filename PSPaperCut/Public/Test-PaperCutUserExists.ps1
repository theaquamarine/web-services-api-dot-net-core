function Test-PaperCutUserExists {
    [CmdletBinding()]
    [OutputType("System.Boolean")]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.UserExists($Username)
    }
}
