function Set-PaperCutUserAccountSelectionAutoSelectSharedAccount {
    <#
        .SYNOPSIS
            Set the user to Auto Charge to a Single Shared Account
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the user with the account to credit.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The name of the shared account.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $AccountName,

        #Transactions should be primarily charged to the user, not the account
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [bool] $ChargeToPersonal,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($username, 'SetUserAccountSelectionAutoSelectSharedAccount')) {
            $PaperCutServer.SetUserAccountSelectionAutoSelectSharedAccount($Username, $AccountName, $ChargeToPersonal)
        }
    }
}
