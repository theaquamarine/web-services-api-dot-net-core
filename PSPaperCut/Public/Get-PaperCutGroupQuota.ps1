function Get-PaperCutGroupQuota {
    <#
        .SYNOPSIS
            Get the group quota allocation settings on a given group.
    #>
    [CmdletBinding()]
    [OutputType("PaperCut.GetGroupQuotaResponse")]
    param (
        #The name of the group.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $GroupName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetGroupQuota($GroupName)
    }
}
