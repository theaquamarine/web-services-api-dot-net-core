function Remove-PaperCutUser {
    <#
        .SYNOPSIS
            Delete/remove an existing user from the user list. Use this method with care.  Calling this will perminantly delete the user account from the user list (print and transaction history records remain).
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The username of the user to delete/remove.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [bool] $RedactUserData = $false,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($username, 'DeleteExistingUser')) {
            $PaperCutServer.DeleteExistingUser($Username, $RedactUserData)
        }
    }
}
