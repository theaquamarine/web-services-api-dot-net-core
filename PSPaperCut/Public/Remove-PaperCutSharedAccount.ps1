function Remove-PaperCutSharedAccount {
    <#
        .SYNOPSIS
            Delete a shared account from the system.  Use this method with care.  Deleting a shared account will permanently delete it from the shared account list (print history records will remain).
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the shared account to delete.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $SharedAccountName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($sharedAccountName, 'DeleteExistingSharedAccount')) {
            $PaperCutServer.DeleteExistingSharedAccount($SharedAccountName)
        }
    }
}
