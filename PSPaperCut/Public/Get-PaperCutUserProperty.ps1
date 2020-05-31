function Get-PaperCutUserProperty {
    <#
        .SYNOPSIS
            Gets a user property.
    #>
    [CmdletBinding()]
    [OutputType("System.String")]
    param (
        #The name of the user.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Username,

        #The name of the property to get.  The following list of property names can also be set using : balance: the user's balance, unformatted, e.g. "1234.56".primary-card-numbersecondary-card-numbercard-pindepartmentdisabled-net: true if the user's 'net access is disabled, otherwise falsedisabled-print: true if the user's printing is disabled, otherwise falseemailfull-nameinternal: true if this is an internal user, otherwise falsenotesofficeprint-stats.job-count: total number of print jobs from this user, unformatted, e.g. "1234" print-stats.page-count: total number of pages printed by this user, unformatted, e.g. "1234" net-stats.data-mb: total 'net MB used by this user, unformatted, e.g. "1234.56" net-stats.time-hours: total 'net hours used by this user, unformatted, e.g. "1234.56" restricted: true if this user's printing is restricted, false if they are unrestricted. The following options are "read only", i.e. cannot be set using : account-selection.mode: the user's account selection mode.  One of the following: AUTO_CHARGE_TO_PERSONAL_ACCOUNTCHARGE_TO_PERSONAL_ACCOUNT_WITH_CONFIRMATIONAUTO_CHARGE_TO_SHAREDSHOW_ACCOUNT_SELECTION_POPUPSHOW_ADVANCED_ACCOUNT_SELECTION_POPUPSHOW_MANAGER_MODE_POPUPaccount-selection.can-charge-personal: true if the user's account selection settings allow them to charge jobs to their personal account, otherwise false. account-selection.can-charge-shared-from-list: true if the user's account selection settings allow them to select a shared account to charge from a list of shared accounts, otherwise false. account-selection.can-charge-shared-by-pin: true if the user's account selection settings allow them to charge a shared account by PIN or code, otherwise false.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $PropertyName,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.GetUserProperty($Username, $PropertyName)
    }
}
