function Disable-PaperCutPrintingForUser {
    <#
        .SYNOPSIS
            Disable printing for a user for a specified period of time.
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The name of the user to disable printing for.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The number of minutes to disable printing for the user. If the value is -1 the printer will be disabled for all time until re-enabled.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [int] $DisableMins,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.DisablePrintingForUser($Username, $DisableMins)
    }
}
