function Get-PaperCutUserProperties {
    <#
        .SYNOPSIS
            Get multiple user properties at once (to save multiple calls).
    #>
    [CmdletBinding()]
    [OutputType("System.String[]")]
    param (
        #The name of the user.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The names of the properties to get.  See  for valid property names.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string[]] $PropertyNames,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetUserProperties($Username, $PropertyNames)
    }
}
