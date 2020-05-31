function Set-PaperCutSharedAccountAccountBalance {
    <#
        .SYNOPSIS
            Set a shared account's account balance.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the account to be adjusted.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $AccountName,

        #The balance to set (positive or negative).
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [double] $Balance,

        #The comment to be associated with the transaction.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $Comment,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($accountName, 'SetSharedAccountAccountBalance')) {
            $PaperCutServer.SetSharedAccountAccountBalance($AccountName, $Balance, $Comment)
        }
    }
}
