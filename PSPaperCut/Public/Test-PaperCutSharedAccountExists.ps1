function Test-PaperCutSharedAccountExists {
    <#
        .SYNOPSIS
            Test to see if a shared account exists.
    #>
    [CmdletBinding()]
    [OutputType("System.Boolean")]
    param (
        #The name of the shared account.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $AccountName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.SharedAccountExists($AccountName)
    }
}
