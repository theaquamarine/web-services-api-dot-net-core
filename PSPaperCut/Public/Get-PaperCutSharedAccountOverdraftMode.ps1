function Get-PaperCutSharedAccountOverdraftMode {
    <#
        .SYNOPSIS
            Get the shared account's overdraft mode
    #>
    [CmdletBinding()]
    [OutputType("System.String")]
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
        $PaperCutServer.GetSharedAccountOverdraftMode($SharedAccountName)
    }
}
