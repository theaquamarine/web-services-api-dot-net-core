function Add-PaperCutSharedAccountAccessGroup {
    <#
        .SYNOPSIS
            Allow the given group access to the given shared account without using a pin.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the shared account to allow access to.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $SharedAccountName,

        #The name of the group to give access to.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $GroupName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($sharedAccountName, 'AddSharedAccountAccessGroup')) {
            $PaperCutServer.AddSharedAccountAccessGroup($SharedAccountName, $GroupName)
        }
    }
}
