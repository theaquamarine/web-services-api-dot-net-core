function Add-PaperCutSharedAccountAccessUser {
    <#
        .SYNOPSIS
            Allow the given user access to the given shared account without using a pin.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the shared account to allow access to.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $SharedAccountName,

        #The name of the user to give access to.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($sharedAccountName, 'AddSharedAccountAccessUser')) {
            $PaperCutServer.AddSharedAccountAccessUser($SharedAccountName, $Username)
        }
    }
}
