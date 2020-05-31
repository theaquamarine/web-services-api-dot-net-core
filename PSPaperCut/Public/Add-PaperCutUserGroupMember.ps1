function Add-PaperCutUserGroupMember {
    <#
        .SYNOPSIS
            Adds the user to the specified group
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The user name
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The name of the group.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $GroupName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($username, 'AddUserToGroup')) {
            $PaperCutServer.AddUserToGroup($Username, $GroupName)
        }
    }
}