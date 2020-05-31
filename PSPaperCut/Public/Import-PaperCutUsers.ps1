function Import-PaperCutUsers {
    <#
        .SYNOPSIS
            Import the users contained in the given tab-delimited import file.
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The import file location relative to the application server.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ImportFile,

        #If true, users only existing in the import file will be newly created, otherwise ignored
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [bool] $CreateNewUsers,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.BatchImportUsers($ImportFile, $CreateNewUsers)
    }
}
