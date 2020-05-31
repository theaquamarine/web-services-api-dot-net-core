function Set-PaperCutSharedAccountProperty {
    <#
        .SYNOPSIS
            Sets a shared account property.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the shared account.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $SharedAccountName,

        #The name of the property to set.  See  for valid property names.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $PropertyName,

        #The value of the property to set.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $PropertyValue,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($sharedAccountName, 'SetSharedAccountProperty')) {
            $PaperCutServer.SetSharedAccountProperty($SharedAccountName, $PropertyName, $PropertyValue)
        }
    }
}
