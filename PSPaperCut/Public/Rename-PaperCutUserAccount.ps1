function Rename-PaperCutUserAccount {
    <#
        .SYNOPSIS
            Rename a user account.  Useful when the user has been renamed in the domain / directory, so that usage history can be maintained for the new username.  This should be performed in conjunction with a rename of the user in the domain / user directory, as all future usage and authentication will need to use the new username.
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The username of the user to rename.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $CurrentUserName,

        #The user's new username.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $NewUserName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.RenameUserAccount($CurrentUserName, $NewUserName)
    }
}
