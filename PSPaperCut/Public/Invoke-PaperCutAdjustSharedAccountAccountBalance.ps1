function Invoke-PaperCutAdjustSharedAccountAccountBalance {
    <#
        .SYNOPSIS
            Adjust a shared account's account balance by an adjustment amount. An adjustment bay be positive (add to the account) or negative (subtract from the account).
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The full name of the shared account to adjust.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $AccountName,

        #The adjustment amount. Positive to add credit and negative to subtract.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [double] $Adjustment,

        #A user defined comment to associated with the transaction. This may be a null string.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $Comment,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.AdjustSharedAccountAccountBalance($AccountName, $Adjustment, $Comment)
    }
}
