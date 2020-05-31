function Import-PaperCutSharedAccounts {
    <#
        .SYNOPSIS
            Import the shared accounts contained in the given TSV import file.
    #>
    [CmdletBinding()]
    [OutputType("System.String")]
    param (
        #The import file location relative to the application server.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ImportFile,

        #If true, perform a test only. The printed statistics will show what would have occurred if testing wasn't enabled. No accounts will be modified.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [bool] $Test,

        #If true, accounts that do not exist in the import file but exist in the system will be deleted.  If false, they will be ignored.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [bool] $DeleteNonExistentAccounts,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.BatchImportSharedAccounts($ImportFile, $Test, $DeleteNonExistentAccounts)
    }
}
