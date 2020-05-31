function New-PaperCutSharedAccount {
    <#
        .SYNOPSIS
            Create a new shared account with the given name.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the shared account to create. Use a '\' to denote a subaccount, e.g.: 'parent\sub'
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $SharedAccountName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($sharedAccountName, 'AddNewSharedAccount')) {
            $PaperCutServer.AddNewSharedAccount($SharedAccountName)
        }
    }
}
