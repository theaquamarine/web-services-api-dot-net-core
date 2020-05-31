function Set-PaperCutUserAccountSelectionStandardPopup {
    <#
        .SYNOPSIS
            Set the user to select an acccount from the popup list of approved accounts
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        #The name of the user with the account to credit.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #Allows the user to allocate the transaction to their personal account
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [bool] $AllowPersonal,

        #Sets the popup behavior to present a list of approved accounts to the user
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [bool] $AllowListSelection,

        #Sets the popup behavior to allow the user to enter a PIN code to identify an account
        [Parameter(Mandatory, Position = 3, ValueFromPipelineByPropertyName)]
        [bool] $AllowPinCode,

        #Sets the popup behavior to allow the user to supply alternate credentials as the billable user for the job
        [Parameter(Mandatory, Position = 4, ValueFromPipelineByPropertyName)]
        [bool] $AllowPrintingAsOtherUser,

        #When a shared account is selected the user should be charged for the job with a record of the transaction attributed to the account
        [Parameter(Mandatory, Position = 5, ValueFromPipelineByPropertyName)]
        [bool] $ChargeToPersonalWhenSharedSelected,

        #The default shared account (blank for none)
        [Parameter(Mandatory, Position = 6, ValueFromPipelineByPropertyName)]
        [string] $DefaultSharedAccount,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 7, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($username, 'SetUserAccountSelectionStandardPopup')) {
            $PaperCutServer.SetUserAccountSelectionStandardPopup($Username, $AllowPersonal, $AllowListSelection, $AllowPinCode, $AllowPrintingAsOtherUser, $ChargeToPersonalWhenSharedSelected, $DefaultSharedAccount)
        }
    }
}
