function Reset-PaperCutUserSettings {
    <#
        .SYNOPSIS
            Re-applies initial user settings on the given user. These initial settings are based on group membership.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The user's username
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($username, 'ReapplyInitialUserSettings')) {
            $PaperCutServer.ReapplyInitialUserSettings($Username)
        }
    }
}
