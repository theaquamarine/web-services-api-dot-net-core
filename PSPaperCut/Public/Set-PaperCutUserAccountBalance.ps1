function Set-PaperCutUserAccountBalance {
    <#
        .SYNOPSIS
            Set the balance on a user's account to a set value. This is conducted as a transaction.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The username associated with the user who's account is to be set.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The balance to set the account to.
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
        if ($PSCmdlet.ShouldProcess($username, 'SetUserAccountBalance')) {
            $PaperCutServer.SetUserAccountBalance($Username, $Balance, $Comment, $AccountName)
        }
    }
}
