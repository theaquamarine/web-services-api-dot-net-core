function Get-PaperCutSharedAccountProperties {
    <#
        .SYNOPSIS
            Get multiple shared account properties at once (to save multiple calls).
    #>
    [CmdletBinding()]
    [OutputType("System.String[]")]
    param (
        #The shared account name.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $SharedAccountName,

        #The names of the properties to get.  See  for valid property names.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string[]] $PropertyNames,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetSharedAccountProperties($SharedAccountName, $PropertyNames)
    }
}
