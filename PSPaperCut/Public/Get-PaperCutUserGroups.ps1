function Get-PaperCutUserGroups {
    <#
        .SYNOPSIS
            List all user groups (sorted by groupname) starting at 'offset' and ending at 'limit'. This can be used to enumerate all groups in 'pages'.  When retrieving a list of all groups, the recommended page size / limit is 1000.  Batching in groups of 1000 ensures efficient transfer and processing. E.g.: listUserGroups(0, 1000) - returns users 0 through 999 listUserGroups(1000, 1000) - returns users 1000 through 1999 listUserGroups(2000, 1000) - returns users 2000 through 2999
    #>
    [CmdletBinding()]
    [OutputType("System.String[]")]
    param (
        #The 0-index offset in the list of groups to return.  I.e. 0 is the first group, 1 is the second, etc.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [int] $Offset,

        #The number of groups to return in this batch.  Recommended: 1000.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [int] $Limit,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.ListUserGroups($Offset, $Limit)
    }
}
