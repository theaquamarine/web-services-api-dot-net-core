function Use-PaperCutCard {
    <#
        .SYNOPSIS
            Apply the value of a card to a user's account.
    #>
    [CmdletBinding()]
    [OutputType("System.String")]
    param (
        #The name of the user with the account to credit.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The number of the card to use.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $CardNumber,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.UseCard($Username, $CardNumber)
    }
}
