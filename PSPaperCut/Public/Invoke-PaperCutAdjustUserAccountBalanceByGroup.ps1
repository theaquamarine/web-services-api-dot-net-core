function Invoke-PaperCutAdjustUserAccountBalanceByGroup {
    <#
        .SYNOPSIS
            Adjust the account balance of all users in a group by an adjustment amount. An adjustment may be positive (add to the user's account) or negative (subtract from the account).
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The group for which all users' accounts are to be adjusted.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Group,

        #The adjustment amount. Positive to add credit and negative to subtract.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [double] $Adjustment,

        #A user defined comment to be associated with the transaction. This may be a null string.
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
        $PaperCutServer.AdjustUserAccountBalanceByGroup($Group, $Adjustment, $Comment, $AccountName)
    }
}
