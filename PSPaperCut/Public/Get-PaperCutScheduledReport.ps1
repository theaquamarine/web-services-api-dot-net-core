function Get-PaperCutScheduledReport {
    [CmdletBinding()]
    [OutputType("System.Boolean")]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $AuthToken,

        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $ReportTitle,

        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $SaveLocation,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GenerateScheduledReport($AuthToken, $ReportTitle, $SaveLocation)
    }
}
