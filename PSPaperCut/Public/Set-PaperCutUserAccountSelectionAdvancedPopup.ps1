function Set-PaperCutUserAccountSelectionAdvancedPopup {
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $AuthToken,

        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $UserName,

        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [bool] $AllowPersonal,

        [Parameter(Mandatory, Position = 3, ValueFromPipelineByPropertyName)]
        [bool] $ChargeToPersonalWhenSharedSelected,

        [Parameter(Position = 4, ValueFromPipelineByPropertyName)]
        [string] $DefaultSharedAccount,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 5, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($authToken, 'SetUserAccountSelectionAdvancedPopup')) {
            $PaperCutServer.SetUserAccountSelectionAdvancedPopup($AuthToken, $UserName, $AllowPersonal, $ChargeToPersonalWhenSharedSelected, $DefaultSharedAccount)
        }
    }
}
