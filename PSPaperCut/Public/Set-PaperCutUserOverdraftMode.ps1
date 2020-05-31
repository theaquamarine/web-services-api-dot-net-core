function Set-PaperCutUserOverdraftMode {
    <#
        .SYNOPSIS
            Set the user's overdraft mode
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the user.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #mode - the overdraft mode to use ('individual' or 'default')
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $Mode,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($username, 'SetUserOverdraftMode')) {
            $PaperCutServer.SetUserOverdraftMode($Username, $Mode)
        }
    }
}
