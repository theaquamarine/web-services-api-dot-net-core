function Rename-PaperCutSharedAccount {
    <#
        .SYNOPSIS
            Rename an existing shared account.
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The name of the shared account to rename. Use a '\' to denote a subaccount. e.g.: 'parent\sub'
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $CurrentSharedAccountName,

        #The new shared account name.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $NewSharedAccountName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.RenameSharedAccount($CurrentSharedAccountName, $NewSharedAccountName)
    }
}
