function Get-PaperCutUserAccountBalance {
    <#
        .SYNOPSIS
            Gets a user's current account balance.
    #>
    [CmdletBinding()]
    [OutputType("System.Double")]
    param (
        #The name of the user.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #Optional name of the user's personal account. If blank, the total balance is returned.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $AccountName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetUserAccountBalance($Username, $AccountName)
    }
}
