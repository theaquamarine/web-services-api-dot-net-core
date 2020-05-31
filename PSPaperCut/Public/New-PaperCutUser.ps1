function New-PaperCutUser {
    <#
        .SYNOPSIS
            Trigger the process of adding a new user account. Assuming the user exists in the OS/Network/Domain user directory, the account will be created with the correct initial settings as defined by the rules setup in the admin interface under the Group's section. Calling this method is equivalent to triggering the "new user" event when a new user performs printing for the first time.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The username of the user to add.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($username, 'AddNewUser')) {
            $PaperCutServer.AddNewUser($Username)
        }
    }
}
