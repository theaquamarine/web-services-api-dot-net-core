function Invoke-PaperCutAdjustUserAccountBalanceIfAvailableLeaveRemaining {
    <#
        .SYNOPSIS
            Adjust a user's account balance by an adjustment amount (if there is credit available to leave the specified amount still available in the account).   This can be used to perform atomic account adjustments, without need to check the user's balance first. An adjustment may be positive (add to the user's account) or negative (subtract from the account).
    #>
    [CmdletBinding()]
    [OutputType("System.Boolean")]
    param (
        #The username associated with the user who's account is to be adjusted.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The adjustment amount. Positive to add credit and negative to subtract.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [double] $Adjustment,

        #The amount to leave in the account when deductions are done.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [double] $LeaveRemaining,

        #A user defined comment to associated with the transaction. This may be a null string.
        [Parameter(Mandatory, Position = 3, ValueFromPipelineByPropertyName)]
        [string] $Comment,

        #Optional name of the user's personal account. If blank, the built-in default account is used.
        [Parameter(Mandatory, Position = 4, ValueFromPipelineByPropertyName)]
        [string] $AccountName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 5, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.AdjustUserAccountBalanceIfAvailableLeaveRemaining($Username, $Adjustment, $LeaveRemaining, $Comment, $AccountName)
    }
}
