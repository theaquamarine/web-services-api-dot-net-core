function Remove-PaperCutSharedAccountAccessUser {
    <#
        .SYNOPSIS
            Revoke the given user's access to the given shared account.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the shared account to revoke access to.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $SharedAccountName,

        #The name of the user to revoke access for.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($sharedAccountName, 'RemoveSharedAccountAccessUser')) {
            $PaperCutServer.RemoveSharedAccountAccessUser($SharedAccountName, $Username)
        }
    }
}
