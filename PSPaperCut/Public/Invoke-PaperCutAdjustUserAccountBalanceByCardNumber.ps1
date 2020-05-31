function Invoke-PaperCutAdjustUserAccountBalanceByCardNumber {
    <#
        .SYNOPSIS
            Adjust a user's account balance.  User lookup is by card number.
    #>
    [CmdletBinding()]
    [OutputType("System.Boolean")]
    param (
        #The card number associated with the user who's account is to be adjusted.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $CardNumber,

        #The adjustment amount.  Positive to add credit and negative to subtract.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [double] $Adjustment,

        #A user defined comment to be associated with the transaction.  This may be a null string.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $Comment,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.AdjustUserAccountBalanceByCardNumber($CardNumber, $Adjustment, $Comment)
    }
}
