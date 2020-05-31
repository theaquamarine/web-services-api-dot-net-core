function Get-PaperCutAdHocReport {
    [CmdletBinding()]
    [OutputType("System.Boolean")]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $AuthToken,

        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $ReportType,

        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $DataParams,

        [Parameter(Mandatory, Position = 3, ValueFromPipelineByPropertyName)]
        [string] $ExportTypeExt,

        [Parameter(Mandatory, Position = 4, ValueFromPipelineByPropertyName)]
        [string] $ReportTitle,

        [Parameter(Mandatory, Position = 5, ValueFromPipelineByPropertyName)]
        [string] $SaveLocation,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 6, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GenerateAdHocReport($AuthToken, $ReportType, $DataParams, $ExportTypeExt, $ReportTitle, $SaveLocation)
    }
}
