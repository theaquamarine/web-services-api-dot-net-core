function Get-PaperCutSharedAccountProperty {
    <#
        .SYNOPSIS
            Gets a shared account property.
    #>
    [CmdletBinding()]
    [OutputType("System.String")]
    param (
        #The name of the shared account.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $SharedAccountName,

        #The name of the property to get.  Valid options include: access-groups, access-users, account-id, balance, comment-option, disabled, invoice-option, notes, overdraft-amount, pin, restricted.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $PropertyName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetSharedAccountProperty($SharedAccountName, $PropertyName)
    }
}
