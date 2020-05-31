function Get-PaperCutUserSharedAccounts {
    <#
        .SYNOPSIS
            List all shared accounts (sorted by account name) that the user has access to, starting at offset and listing only limit accounts. This can be used to enumerate all shared accounts in 'pages'. When retrieving a list of all shared accounts, the recommended page size / limit is 1000. Batching in groups of 1000 ensures efficient transfer and processing. E.g.: listUserSharedAccounts("user", 0, 1000) - returns accounts 0 through 999 listUserSharedAccounts("user", 1000, 1000) - returns accounts 1000 through 1999 listUserSharedAccounts("user", 2000, 1000) - returns accounts 2000 through 2999
    #>
    [CmdletBinding()]
    [OutputType("System.String[]")]
    param (
        #The user's name.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The 0-index offset in the list of accounts to return.  I.e. 0 is the first account, 1 is the second, etc.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [int] $Offset,

        #The number of accounts to return in this batch.  Recommended: 1000.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [int] $Limit,

        #If true, list accounts regardless of current shared account mode.
        [Parameter(Mandatory, Position = 3, ValueFromPipelineByPropertyName)]
        [bool] $IgnoreAccountMode,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 4, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.ListUserSharedAccounts($Username, $Offset, $Limit, $IgnoreAccountMode)
    }
}
