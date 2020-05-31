function Get-PaperCutUserNameBySecondaryUserName {
    [CmdletBinding()]
    [OutputType("System.String")]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $SecondaryUserName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.LookUpUserNameBySecondaryUserName($SecondaryUserName)
    }
}
