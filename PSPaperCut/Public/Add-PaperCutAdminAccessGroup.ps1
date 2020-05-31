function Add-PaperCutAdminAccessGroup {
    <#
        .SYNOPSIS
            Adds a group as an admin group with default admin rights.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the group.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $GroupName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($groupName, 'AddAdminAccessGroup')) {
            $PaperCutServer.AddAdminAccessGroup($GroupName)
        }
    }
}