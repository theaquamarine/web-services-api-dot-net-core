function Get-PaperCutSharedAccountAccountBalance {
    <#
        .SYNOPSIS
            Gets a shared account's current balance.
    #>
    [CmdletBinding()]
    [OutputType("System.Double")]
    param (
        #The name of the shared account.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $SharedAccountName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetSharedAccountAccountBalance($SharedAccountName)
    }
}
