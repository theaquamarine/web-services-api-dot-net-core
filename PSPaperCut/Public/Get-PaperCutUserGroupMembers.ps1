function Get-PaperCutUserGroupMembers {
    <#
        .SYNOPSIS
            Retrive all users in group.
    #>
    [CmdletBinding()]
    [OutputType("System.String[]")]
    param (
        #The group to look up
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $GroupName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetGroupMembers($GroupName)
    }
}
