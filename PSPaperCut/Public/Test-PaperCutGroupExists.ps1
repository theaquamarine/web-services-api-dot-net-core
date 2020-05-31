function Test-PaperCutGroupExists {
    <#
        .SYNOPSIS
            Test to see if a group associated with groupname exists in the system.
    #>
    [CmdletBinding()]
    [OutputType("System.Boolean")]
    param (
        #The groupname to test.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $GroupName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GroupExists($GroupName)
    }
}
