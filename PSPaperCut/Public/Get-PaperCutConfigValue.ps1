function Get-PaperCutConfigValue {
    <#
        .SYNOPSIS
            Get the config value from the server.
    #>
    [CmdletBinding()]
    [OutputType("System.String")]
    param (
        #The name of the config value to retrieve.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $ConfigName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetConfigValue($ConfigName)
    }
}
