function Set-PaperCutInternalAdminPassword {
    <#
        .SYNOPSIS
            Change the internal admin password.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("System.Boolean")]
    param (
        #The new password.  Cannot be blank.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $NewPassword,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($newPassword, 'ChangeInternalAdminPassword')) {
            $PaperCutServer.ChangeInternalAdminPassword($NewPassword)
        }
    }
}
