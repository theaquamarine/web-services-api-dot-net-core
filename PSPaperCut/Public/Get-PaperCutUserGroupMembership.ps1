function Get-PaperCutUserGroupMembership {
    <#
        .SYNOPSIS
            Retrive all groups a user is a member of.
    #>
    [CmdletBinding()]
    [OutputType("System.String[]")]
    param (
        #The username to look up
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $UserName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetUserGroups($UserName)
    }
}
