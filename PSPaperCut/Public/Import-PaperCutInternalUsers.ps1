function Import-PaperCutInternalUsers {
    <#
        .SYNOPSIS
            Import the internal users contained in the given tab-delimited import file.
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The import file location relative to the application server.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ImportFile,

        #True to overwrite existing user passwords, false to only update un-set passwords.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [bool] $OverwriteExistingPasswords,

        #True to overwrite existing user PINs, false to only update un-set PINs.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [bool] $OverwriteExistingPINs,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.BatchImportInternalUsers($ImportFile, $OverwriteExistingPasswords, $OverwriteExistingPINs)
    }
}
