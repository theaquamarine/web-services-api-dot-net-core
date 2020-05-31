function Set-PaperCutSharedAccountOverdraftMode {
    <#
        .SYNOPSIS
            Set the shared account's overdraft mode
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the shared account.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $SharedAccountName,

        #the shared account's new overdraft mode ('individual' or 'default')
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $Mode,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($sharedAccountName, 'SetSharedAccountOverdraftMode')) {
            $PaperCutServer.SetSharedAccountOverdraftMode($SharedAccountName, $Mode)
        }
    }
}
