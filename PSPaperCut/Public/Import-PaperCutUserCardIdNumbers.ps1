function Import-PaperCutUserCardIdNumbers {
    <#
        .SYNOPSIS
            Import the user card/ID numbers and PINs contained in the given tab-delimited import file.
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The import file location relative to the application server.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ImportFile,

        #If true, users with a PIN already defined will have it overwritten by the PIN in the import file, if specified. If false, the existing PIN will not be overwritten.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [bool] $OverwriteExistingPINs,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.BatchImportUserCardIdNumbers($ImportFile, $OverwriteExistingPINs)
    }
}
