function Disable-PaperCutSharedAccount {
    <#
        .SYNOPSIS
            Disable shared account for a specified period of time.
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The name of the shared account to disable.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $SharedAccountName,

        #The number of minutes to disable the shared account for. If the value is -1 the shared account will be disabled permanently until re-enabled.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [int] $DisableMins,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.DisableSharedAccount($SharedAccountName, $DisableMins)
    }
}
