function Reset-PaperCutUserCounts {
    <#
        .SYNOPSIS
            Reset the counts (pages and job counts) associated with a user account.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The username associated with the user who's counts are to be reset.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The name of the user/script/process reseting the counts.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $ResetBy,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($username, 'ResetUserCounts')) {
            $PaperCutServer.ResetUserCounts($Username, $ResetBy)
        }
    }
}
