function New-PaperCutUserGroup {
    <#
        .SYNOPSIS
            Add a new group to system's group list.  The caller is responsible for ensuring that the supplied group name is valid and exists in the linked user directory source.  The status of this method may be monitored with calls to getTaskStatus().
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the new group to add. The group should already exist in the network user directory.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $GroupName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($groupName, 'AddNewGroup')) {
            $PaperCutServer.AddNewGroup($GroupName)
        }
    }
}
