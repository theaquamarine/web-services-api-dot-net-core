function Invoke-PaperCutAdjustUserAccountBalance {
    <#
        .SYNOPSIS
            Adjust a user's account balance by an adjustment amount. An adjustment bay be positive (add to the user's account) or negative (subtract from the account).
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The username associated with the user who's account is to be adjusted.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The adjustment amount. Positive to add credit and negative to subtract.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [double] $Adjustment,

        #A user defined comment to associated with the transaction. This may be a null string.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $Comment,

        #Optional name of the user's personal account. If blank, the built-in default account is used.
        [Parameter(Mandatory, Position = 3, ValueFromPipelineByPropertyName)]
        [string] $AccountName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 4, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.AdjustUserAccountBalance($Username, $Adjustment, $Comment, $AccountName)
    }
}
