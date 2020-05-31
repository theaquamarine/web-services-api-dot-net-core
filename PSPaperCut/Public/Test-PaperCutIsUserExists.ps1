function Test-PaperCutIsUserExists {
    <#
        .SYNOPSIS
            Test to see if a user associated with "username" exists in the system.
    #>
    [CmdletBinding()]
    [OutputType("System.Boolean")]
    param (
        #The username to test.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.IsUserExists($Username)
    }
}
