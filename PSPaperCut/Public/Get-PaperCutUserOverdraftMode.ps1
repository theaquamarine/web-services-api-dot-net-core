function Get-PaperCutUserOverdraftMode {
    <#
        .SYNOPSIS
            Get the user's overdraft mode
    #>
    [CmdletBinding()]
    [OutputType("System.String")]
    param (
        #The name of the user.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetUserOverdraftMode($Username)
    }
}
