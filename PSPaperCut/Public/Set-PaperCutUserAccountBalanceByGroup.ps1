function Set-PaperCutUserAccountBalanceByGroup {
    <#
        .SYNOPSIS
            Set the balance for each member of a group to the given value.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The group for which all users' balance is to be set.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Group,

        #The value to set all users' balance to.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [double] $Balance,

        #A user defined comment to associate with the transaction. This may be a null string.
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
        if ($PSCmdlet.ShouldProcess($group, 'SetUserAccountBalanceByGroup')) {
            $PaperCutServer.SetUserAccountBalanceByGroup($Group, $Balance, $Comment, $AccountName)
        }
    }
}
