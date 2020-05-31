function Sync-PaperCutGroup {
    <#
        .SYNOPSIS
            Syncs an existing group with the configured directory server, updates the group membership.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("System.Boolean")]
    param (
        #The name of the new group to sync. The group should already exist in the network user directory.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $GroupName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($groupName, 'SyncGroup')) {
            $PaperCutServer.SyncGroup($GroupName)
        }
    }
}
