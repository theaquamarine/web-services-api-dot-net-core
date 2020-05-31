function Get-PaperCutUserAccounts {
    <#
        .SYNOPSIS
            List all user accounts (sorted by username) starting at 'offset' and ending at 'limit'. This can be used to enumerate all user accounts in 'pages'.  When retrieving a list of all user accounts, the recommended page size / limit is 1000.  Batching in groups of 1000 ensures efficient transfer and processing. E.g.: listUserAccounts(0, 1000) - returns users 0 through 999 listUserAccounts(1000, 1000) - returns users 1000 through 1999 listUserAccounts(2000, 1000) - returns users 2000 through 2999
    #>
    [CmdletBinding()]
    [OutputType("System.String[]")]
    param (
        #The 0-index offset in the list of users to return.  I.e. 0 is the first user, 1 is the second, etc.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [int] $Offset,

        #The number of accounts to return in this batch.  Recommended: 1000.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [int] $Limit,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.ListUserAccounts($Offset, $Limit)
    }
}
