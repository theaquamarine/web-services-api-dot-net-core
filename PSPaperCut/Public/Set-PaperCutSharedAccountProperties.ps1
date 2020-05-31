function Set-PaperCutSharedAccountProperties {
    <#
        .SYNOPSIS
            Set multiple shared account properties at once (to save multiple calls).
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The shared account name.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $SharedAccountName,

        #The list of property names and values to set. E.g. [["balance", "1.20"], ["invoice-option", "ALWAYS_INVOICE"]]. See  for valid property names.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string[][]] $PropertyNamesAndValues,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($sharedAccountName, 'SetSharedAccountProperties')) {
            $PaperCutServer.SetSharedAccountProperties($SharedAccountName, $PropertyNamesAndValues)
        }
    }
}
