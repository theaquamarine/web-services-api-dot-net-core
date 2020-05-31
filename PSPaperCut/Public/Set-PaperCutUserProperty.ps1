function Set-PaperCutUserProperty {
    <#
        .SYNOPSIS
            Sets a user property.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the user.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The name of the property to set.  Valid options include: balance, card-number, card-pin, department, disabled-net, disabled-print, email, full-name, notes, office, password, print-stats.job-count, print-stats.page-count, net-stats.data-mb, net-stats.time-hours, restricted.
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
        if ($PSCmdlet.ShouldProcess($username, 'SetUserProperty')) {
            $PaperCutServer.SetUserProperty($Username, $PropertyName, $PropertyValue)
        }
    }
}
