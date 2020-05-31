function Add-PaperCutAdminAccessUser {
    <#
        .SYNOPSIS
            Adds a user as an admin with default admin rights.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the user.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($username, 'AddAdminAccessUser')) {
            $PaperCutServer.AddAdminAccessUser($Username)
        }
    }
}
