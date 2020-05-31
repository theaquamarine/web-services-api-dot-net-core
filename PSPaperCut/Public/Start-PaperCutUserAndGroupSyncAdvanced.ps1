function Start-PaperCutUserAndGroupSyncAdvanced {
    <#
        .SYNOPSIS
            An advanced version of the user and group synchronization process providing control over the sync behaviour. A call to this method will commence the sync process and the operation will complete in the background.
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #If set to True, old users will be deleted.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [bool] $DeleteNonExistentUsers,

        #If set to True, user details such as full-name, email, etc. will be synced with the underlying OS/Network/Domain user directory.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [bool] $UpdateUserDetails,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.PerformUserAndGroupSyncAdvanced($DeleteNonExistentUsers, $UpdateUserDetails)
    }
}
