function Get-PaperCutSharedAccounts {
    <#
        .SYNOPSIS
            List all shared accounts (sorted by account name) starting at offset and ending at limit. This can be used to enumerate all shared accounts in 'pages'.  When retrieving a list of all shared accounts, the recommended page size / limit is 1000.  Batching in groups of 1000 ensures efficient transfer and processing. E.g.: listSharedAccounts(0, 1000) - returns accounts 0 through 999 listSharedAccounts(1000, 1000) - returns accounts 1000 through 1999 listSharedAccounts(2000, 1000) - returns accounts 2000 through 2999
    #>
    [CmdletBinding()]
    [OutputType("System.String[]")]
    param (
        #The 0-index offset in the list of accounts to return.  I.e. 0 is the first account, 1 is the second, etc.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [int] $Offset,

        #The number of users to return in this batch.  Recommended: 1000.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [int] $Limit,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.ListSharedAccounts($Offset, $Limit)
    }
}
