function Set-PaperCutUserAccountSelectionAutoChargePersonal {
    <#
        .SYNOPSIS
            Set the user to Auto Charge to Personal
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the user with the account to credit.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #If a popup confirmation is to be used (Optional. Defaults to false)
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [bool] $WithPopupConfirmation = $false,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($username, 'SetUserAccountSelectionAutoChargePersonal')) {
            $PaperCutServer.SetUserAccountSelectionAutoChargePersonal($Username, $WithPopupConfirmation)
        }
    }
}
