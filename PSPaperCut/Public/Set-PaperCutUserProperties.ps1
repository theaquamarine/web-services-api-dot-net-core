function Set-PaperCutUserProperties {
    <#
        .SYNOPSIS
            Set multiple user properties at once (to save multiple calls).
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the user.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The list of property names and values to set. E.g. [["balance", "1.20"], ["office", "East Wing"]].  See for valid property names.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string[][]] $PropertyNamesAndValues,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($username, 'SetUserProperties')) {
            $PaperCutServer.SetUserProperties($Username, $PropertyNamesAndValues)
        }
    }
}
