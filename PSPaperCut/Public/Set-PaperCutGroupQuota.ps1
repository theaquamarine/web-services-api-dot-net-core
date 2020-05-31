function Set-PaperCutGroupQuota {
    <#
        .SYNOPSIS
            Set the group quota allocation settings on a given group.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the group.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $GroupName,

        #The quota amount to set.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [double] $QuotaAmount,

        #The schedule period (one of either NONE, DAILY, WEEKLY or MONTHLY);
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $Period,

        #The maximum quota accumulation.
        [Parameter(Mandatory, Position = 3, ValueFromPipelineByPropertyName)]
        [double] $QuotaMaxAccumulation,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 4, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($groupName, 'SetGroupQuota')) {
            $PaperCutServer.SetGroupQuota($GroupName, $QuotaAmount, $Period, $QuotaMaxAccumulation)
        }
    }
}
